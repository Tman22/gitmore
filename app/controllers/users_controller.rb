class UsersController < ApplicationController

  def show
    @follow = Follow.count(current_service)
    @repos = Repo.all(current_service)
    @commits = Repo.recent_commit(current_service)
    @org = Repo.organizations(current_service)
  end

end
