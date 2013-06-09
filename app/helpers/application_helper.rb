module ApplicationHelper

  def flash_class(level)
    case level
    when :notice; "alert alert-info"
    when :success; "alert alert-success"
    when :error; "alert alert-error"
    when :alert; "alert alert-error"
    end
  end

  def formatted_conference(conference)
    text = "#{conference.name}"
    text << " in #{conference.city}" if conference.city
    text << ", #{conference.state}" if conference.city && conference.state
    text << "<br />"
    text << conference.start_date.to_s(:concise)
    text << "- #{conference.end_date.to_s(:concise)}" if conference.end_date
    text
  end

  def formatted_proposal(proposal)
    %{
      <em>#{proposal.talk.title}</em><br />
      #{formatted_conference(proposal.conference)}
    }
  end

  def icon_for(user, attribute)
    user.send("has_#{attribute.to_s}?") ? 'icon-ok' : 'icon-star'
  end

end
