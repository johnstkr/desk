module Desk

  def self.authenticate
    #do oauth dance
    consumer = OAuth::Consumer.new(
        ENV["desk_api_key"],
        ENV["desk_api_secret"],
        :site => ENV["desk_api_url"],
        :scheme => :header
    )

    return OAuth::AccessToken.from_hash(
        consumer,
        :oauth_token => ENV["desk_oauth_token"],
        :oauth_token_secret => ENV["desk_oauth_secret"]
    )

  end

  def self.request(path, method, payload)
    url = "#{ENV["desk_api_url"]}/api/#{ENV["desk_api_version"]}/#{path}"
    headers = {'Accept' => 'application/json', 'Content-Type' => 'application/json'}
    token = self.authenticate
    if token
      case method
        when :get
          response = token.request(method, url, headers)

        when :post
          response = token.post(url, payload.to_json, headers)

        when :patch
          response = token.post(url, payload.to_json, headers.merge!({"x-http-method-override" => "PATCH"}))
        else
          Rails.logger "Bad method requested #{method}"
      end

      if response.kind_of? Net::HTTPSuccess
        JSON.parse(response.body)
      else
        Rails.logger "The response for an api request returned an non-successful http error code"
        return false
      end

    else
      Rails.logger "Unable to authenticate to the api"
      return false
    end
  end

end