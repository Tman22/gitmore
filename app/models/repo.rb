class Repo

  def self.all(current_service)
    list = current_service.contributer.map { |repo| [ repo[:full_name], repo[:updated_at].split("T")[0] ] }
    list.sort_by! { |name, date| date }.reverse
  end

  def self.recent_commit(current_service)
    list = current_service.commits
    b = list.map { |repo| repo[:payload][:commits]  }.compact.flatten
    e = b.select { |commit| commit[:author][:name] == "Taylor Moore"}
    e.map { |commit| [commit[:message], commit[:url]] }
  end

  private

  def self.build_object(data)
    OpenStruct.new(data)
  end
end
