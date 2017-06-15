require 'rails_helper'

RSpec.describe "Notes", type: :request do
  describe "GET /notes" do
    it "Should list all notes" do
      get notes_path
      expect(response).to have_http_status(200)
    end
  end

end
