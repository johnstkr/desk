class Label
  include Desk
  attr_accessor :id, :description, :name, :type, :active, :color

  def initialize(id, description, name, active, color)
    @id = id
    @description = description
    @name = name
    @active = active
    @color = color
    end

end
