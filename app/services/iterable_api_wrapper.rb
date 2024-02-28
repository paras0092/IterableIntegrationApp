require 'httparty'

class IterableApiWrapper
  include HTTParty

  base_uri 'https://api.iterable.com/api'

  def self.create_event(user_id, event_name, data)
    endpoint = "/events/track"
    options = {
      headers: {
        'Api-Key' => ENV['ITERABLE_API_KEY'],
        'Content-Type' => 'application/json'
      },
      body: {
        userId: user_id,
        eventName: event_name,
        data: data
      }.to_json
    }

    response = post(endpoint, options)
    debugger
    handle_response(response)
  end

  def self.send_email(user_id, template_id)
    endpoint = "/email/target"
    options = {
      headers: {
        'Api-Key' => ENV['ITERABLE_API_KEY'],
        'Content-Type' => 'application/json'
      },
      body: {
        userId: user_id,
        templateId: template_id
      }.to_json
    }

    response = post(endpoint, options)
    debugger
    handle_response(response)
  end

  private

  def self.handle_response(response)
    if response.success?
      { success: true, message: 'Request successful' }
    else
      { success: false, message: "Request failed: #{response.code} - #{response.parsed_response}" }
    end
  end
end