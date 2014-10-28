class Filter
  include Desk
  attr_accessor :name, :id

  @@path = "filters"

  def initialize(name, id)
    @name = name
    @id = id
  end

  def self.find(id)
    response = Desk.request("#{@@path}/#{id}", :get, nil)
    Filter.new(response['name'], parse_id(response))
  end

  def self.parse_id(link)
    #since id doesn't seem to be provided,lets get it off the end of the self link
    id = link['_links']['self']['href'].to_s.split("/").last
  end
end
