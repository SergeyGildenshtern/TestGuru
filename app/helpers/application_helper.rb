module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, "https://github.com/#{author}/#{repo}/", target: '_blank'
  end

  def flash_message(message)
    content_tag :div, flash[message], class: 'flash alert' if flash[message]
  end
end
