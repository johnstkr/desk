class Filter
  include DeskAPI

  attr_accessor :name, :id

  def initialize(name, id)
    @name = name
    @id = id
  end

  def self.find(id)
    response = DeskAPI.request("filters/#{id}", :get, nil)
    Filter.new(response['name'], parse_id(response))
  end

  def self.parse_id(link)
    #since id doesn't seem to be provided,lets get it off the end of the self link
    link['_links']['self']['href'].to_s.split("/").last
  end

  def self.list
    filters_hash = DeskAPI.request("filters", :get, nil)
    *filters_hash = filters_hash['_embedded']['entries']
    filters = filters_hash.map { |filter|
      Filter.new(filter['name'], parse_id(filter))
    }

    filters
  end

  def cases
    cases_hash = DeskAPI.request("filters/#{@id}/cases", :get, nil)
    *cases_hash = cases_hash['_embedded']['entries']
    cases = cases_hash.map { |kase|
      kase = Case.new(kase['id'], kase['type'], kase['subject'], kase['status'], kase['description'])
      kase.get_labels
      kase
    }

    cases
  end

end
