require 'rails_helper'

describe EventsController, type: :controller do
  describe 'POST #create_event_a' do
    it 'creates Event A and redirects' do
      VCR.use_cassette('iterable_create_event_a') do
        post :create_event_a
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #create_event_b' do
    it 'sends email for Event B and redirects' do
      VCR.use_cassette('iterable_send_email_event_b') do
        post :create_event_b
        expect(response).to redirect_to(root_path)
      end
    end
  end
end