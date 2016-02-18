class Follow

  def self.count(current_service)
    [current_service.followers.count, current_service.following.count]
  end

  private

  def self.build_object(data)
    OpenStruct.new(data)
  end
end
