module VisitsHelper
  def recent_visitors
    recent_visitor_ids = []

    current_user.inbound_visits.select("visitor_id,
     created_at").order("created_at DESC").each do |visit|
       unless recent_visitor_ids.include?(visit.visitor_id)
         recent_visitor_ids << visit.visitor_id
       end
    end

    recent_visitor_ids.map { |id| User.find(id) }
  end
end