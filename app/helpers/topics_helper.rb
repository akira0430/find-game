module TopicsHelper
  def current_user?(user)
    user == current_user
  end

  def current_user?(topic)
    topic == current_user
  end
end
