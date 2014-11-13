module Adzerk
  class AdType

    def initialize(args= {})
      @client = args[:client]
    end

    def create(opts={})
      data = { 'adtype' => camelize_data(opts).to_json }
      response = @client.post_request('adtypes', data)
      parse_response(response)
    end

    def get(id)
      response = @client.get_request("adtypes/#{id}")
      parse_response(response)
    end

    def list
      response = @client.get_request(endpoint)
      parse_response(response)
    end

    def update(opts={})
      id = opts[:id].to_s
      data = { adtype => camelize_data(opts).to_json }
      response = @client.put_request("adtypes/#{id}", data)
      parse_response(response)
    end

    def delete(id)
      url = "adtypes/#{id}/delete"
      @client.get_request(url)
    end
  end
end