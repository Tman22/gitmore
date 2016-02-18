require 'rails_helper'

describe 'GitHubService' do
  user = User.create(name: "Tman22", token: ENV['TEST_SECRET'])
  context "#followers" do
    it "returns followers" do
      VCR.use_cassette("git_hub_service#followers") do
        service = GitHubService.new(user)
        followers = service.followers

        # expect(followers).to eq("ToniRib")
        # expect(followers[:somthing]).to eq("something")
        expect(followers.count).to eq(2)
      end
    end
  end
end
