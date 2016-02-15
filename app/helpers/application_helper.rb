module ApplicationHelper
  def link_to_follow_or_unfollow(person, relationship_id = nil)
    if current_person.can_follow? person
      link_to_follow person
    else
      link_to_unfollow person
    end
  end

  def find_current_person_relationship_with(leader:)
    Relationship.where(leader_id: leader.id, follower_id: current_person.id).first
  end

  def link_to_follow(person)
    link_to relationships_path(leader_id: person.id), method: :post, class: "follow list-group-item" do 
      (person.email + "" + (content_tag :span, "Follow", class: "label label-info pull-right")).html_safe
    end
  end

  def link_to_unfollow(person)
    relationship = find_current_person_relationship_with(leader: person)
    link_to relationship_path(relationship), method: :delete, class: "unfollow list-group-item" do 
      (person.email + "" + (content_tag :span, "Unfollow", class: "label label-warning pull-right")).html_safe
    end
  end
end
