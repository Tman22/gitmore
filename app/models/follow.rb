class Follow

  def self.count(current_service)
    [current_service.followers.count, current_service.following.count, current_service.starred.count]
  end

  def self.all(current_service)
    current_service.following.map { |person| [ person[:login], person[:avatar_url] ] }
  end

  def self.recent_commits(current)
    @current_service = current
    second_parse
  end

  private

  def self.zeroth_parse
    e = @current_service.following.map { |person| @current_service.individual(person[:login])}.flatten
  end

  def self.first_parse
    zeroth_parse.map { |repo| repo[:payload][:commits] }.compact.flatten
  end

  def self.second_parse
    first_parse.group_by { |commit| commit[:author][:name] }
  end

  # def self.second_parse
  #   third_parse.map { |commit | { commit[:author][:name] => [commit[:message],  commit[:url]] }  }
  #   # first_parse.select { |commit| commit[:author][:name] }
  # end
  #
  # def self.third_parse
  # end

end
