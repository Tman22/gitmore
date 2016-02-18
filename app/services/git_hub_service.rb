class GitHubService
  attr_reader :connection, :nickname

  def initialize(current_user)
    @nickname = current_user.nickname
    @connection = Faraday.new(url: "https://api.github.com/")
    connection.headers = {"Authorization" => "token #{current_user.token}"}
  end
#  { access_token: @current_user.token}
  def followers
    # binding.pry
    parse(connection.get("/users/#{nickname}/followers"))
  end

  def following
    parse(connection.get("/users/#{nickname}/following"))
  end

  def contributer
    parse(connection.get("users/#{nickname}/repos"))
  end

  def commits
    parse(connection.get("users/#{nickname}/events/public"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
