class GitHubService
  attr_reader :connection, :nickname

  def initialize(current_user)
    @nickname = current_user.nickname
    @connection = Faraday.new(url: "https://api.github.com/")
    connection.headers = {"Authorization" => "token #{current_user.token}"}
  end

  def followers
    parse(connection.get("/users/#{nickname}/followers"))
  end

  def following
    parse(connection.get("/users/#{nickname}/following"))
  end

  def starred
    parse(connection.get("/users/#{nickname}/starred"))
  end

  def contributer
    parse(connection.get("users/#{nickname}/repos"))
  end

  def commits
    parse(connection.get("users/#{nickname}/events/public"))
  end

  def individual(user)
    parse(connection.get("users/#{user}/events/public"))
  end

  def organizations
    parse(connection.get("users/#{nickname}/orgs"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
