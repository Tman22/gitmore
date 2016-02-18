class FollowersController < ApplicationController
  def index
    @people = Follow.all(current_service)
    @commits = Follow.recent_commits(current_service)
  end
end
