class Label
  include DeskAPI
  attr_accessor :id, :description, :name, :type, :active, :color

  def initialize(id, description, name, active, color)
    @id = id
    @description = description
    @name = name
    @active = active
    @color = color
  end

  def self.find(id)
    label_hash = DeskAPI.request("labels/#{id}", :get, nil)
    Label.new(label_hash['id'], label_hash['description'], label_hash['name'], label_hash['active'], label_hash['color'])
  end

  def self.list
    labels_hash = DeskAPI.request("/labels", :get, nil)
    *labels_hash = labels_hash['_embedded']['entries']
    labels = labels_hash.map { |label|
      Label.new(label['id'], label['description'], label['name'], label['active'], label['color'])
    }

    labels
  end

  def self.create(params)
    label = DeskAPI.request("labels", :post, {name: params[:name], description: params[:description], types: ["case", "macro"], color: params[:color]})
    Label.new(label['id'], label['description'], label['name'], label['active'], label['color'])
  end


end
