require 'json'
require 'net/https'

class Chef
  module ThalassaAqueduct

    def request(req_type, path, body = nil)
      request = case req_type
        when :get    then Net::HTTP::Get.new(path)
        when :post   then Net::HTTP::Post.new(path)
        when :put    then Net::HTTP::Put.new(path)
        when :delete then Net::HTTP::Delete.new(path)
      end
      request.add_field "Content-Type", "application/json"
      request.body = body
      http = Net::HTTP.new(node[:thalassa_aqueduct][:host], node[:thalassa_aqueduct][:port])
      http.request(request)
    end

    def create_frontend
      response = request(:put, "/frontends/#{new_resource.name}", {
        :bind => new_resource.bind,
        :backend => new_resource.backend,
        :mode => new_resource.mode,
        :keepalive => new_resource.keepalive,
        :rules => new_resource.rules,
        :natives => new_resource.natives
      }.to_json)

      unless Net::HTTPOK === response || Net::HTTPCreated === response
        raise "Could not create thalassa frontend #{new_resource.name}: #{response.body}"
      end

      response
    end

    def delete_frontend
      request :delete, "/frontends/#{new_resource.name}"
    end

    def create_backend
      params = {
        :type => new_resource.type,
        :version => new_resource.version,
        :balance => new_resource.balance,
        :host => new_resource.host,
        :mode => new_resource.mode,
        :health => new_resource.health,
        :members => new_resource.members,
        :natives => new_resource.natives
      }

      params[:role] = new_resource.role unless new_resource.role.nil?

      response = request(:put, "/backends/#{new_resource.name}", params.to_json)

      unless Net::HTTPOK === response || Net::HTTPCreated === response
        raise "Could not create thalassa backend #{new_resource.name}: #{response.body}"
      end

      response
    end

    def delete_backend
      request :delete, "/backends/#{new_resource.name}"
    end

  end
end