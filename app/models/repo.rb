class Repo

  def self.all(current_service)
    list = current_service.contributer.map { |repo| [ repo[:full_name], repo[:updated_at].split("T")[0] ] }
    list.sort_by! { |name, date| date }.reverse
  end

  def self.recent_commit(current)
    @current_service = current
    third_parse
  end

  def self.organizations(current_service)
    current_service.organizations.map { |org| org[:login] }
  end

  private

  def self.zeroth_parse
    @current_service.commits
  end

  def self.first_parse
    zeroth_parse.map { |repo| repo[:payload][:commits]  }.compact.flatten
  end

  def self.second_parse
    first_parse.select { |commit| commit[:author][:name] == "Taylor Moore"}
  end

  def self.third_parse
    second_parse.map { |commit| [commit[:message], commit[:url]] }
  end

end
