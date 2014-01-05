module VisitsHelper
  def recent_visits
    recent_visitor_ids = []
    visits = []

    current_user.inbound_visits.select("visitor_id,
     created_at").order("created_at DESC").each do |visit|
       unless recent_visitor_ids.include?(visit.visitor_id)
         recent_visitor_ids << visit.visitor_id
         visits << visit
       end
    end

    visits
  end
end