module ApplicationHelper
  def recently_visited
    recent_visitee_ids = []

    current_user.outbound_visits.select("visitee_id,
     created_at").order("created_at DESC").each do |visit|
       break if recent_visitee_ids.count == 8
       unless recent_visitee_ids.include?(visit.visitee_id)
         recent_visitee_ids << visit.visitee_id
       end
    end

    recent_visitee_ids.map { |id| User.find(id) }
  end

  def nice_time(timestamp)
    Time.at(timestamp).utc.strftime("%B %-d at %l:%M %P")
  end
end
