class Case
  include DeskAPI

  attr_accessor :id, :status, :type, :subject, :description, :labels

  def initialize(id, type, subject, status, description)
    @id = id
    @subject = subject
    @type = type
    @status = status
    @description = description
  end

  def self.find(id)
    case_hash = DeskAPI.request("cases/#{id}", :get, nil);
    Case.new(case_hash['id'], case_hash['type'], case_hash['subject'], case_hash['status'], case_hash['description'])
  end

  def self.list
    cases_hash = DeskAPI.request("cases", :get, nil)
    cases_hash = cases_hash['_embedded']['entries']

    cases = cases_hash.map { |kase|
      Case.new(kase['id'], kase['type'], kase['subject'], kase['status'], kase['description'])
    }

    cases
  end

  def get_labels
    labels_hash = DeskAPI.request("cases/#{@id}/labels", :get, nil)
    *labels_hash = labels_hash['_embedded']['entries']
    label_array = labels_hash.map { |label|
      Label.new(label['id'], label['description'], label['name'], label['active'], label['color'])
    }

    @labels = label_array
  end

  def add_label(label)
    *labels = self.get_labels
    labels << label
    label_ids = labels.map &:name
    patch_hash = DeskAPI.request("cases/#{@id}", :patch, {"labels" => label_ids});
    Case.new(patch_hash['id'], patch_hash['type'], patch_hash['subject'], patch_hash['status'], patch_hash['description'])
  end
end
