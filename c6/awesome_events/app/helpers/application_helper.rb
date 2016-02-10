module ApplicationHelper
  #6.48
  def url_for_twitter(user)
    "http://twitter.com/#{user.nickname}"
  end
end
