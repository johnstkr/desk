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

  def self.find(id)
    case_hash = Desk.request("cases/#{id}", :get, nil);
    Case.new(case_hash['id'], case_hash['type'], case_hash['subject'], case_hash['status'], case_hash['description'])
  end
end
