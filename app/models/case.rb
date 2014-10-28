class Case
  include Desk

  attr_accessor :id, :status, :type, :subject, :description, :labels

  def initialize(id, type, subject, status, description)
    @id = id
    @subject = subject
    @type = type
    @status = status
    @description = description
  end


end
