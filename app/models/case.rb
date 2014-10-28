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

  def self.list
    cases_hash = Desk.request("cases", :get, nil)
    cases_hash = cases_hash['_embedded']['entries']

    cases = cases_hash.map { |kase|
      Case.new(kase['id'], kase['type'], kase['subject'], kase['status'], kase['description'])
    }

    cases
  end

  def labels
      labels_hash = Desk.request("cases/#{@id}/labels", :get, nil)
      *labels_hash = labels_hash['_embedded']['entries']
      labels = labels_hash.map { |label|
        Label.new(label['id'], label['description'], label['name'], label['active'], label['color'])
      }

      labels
    end
end
