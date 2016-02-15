Fabricator(:relationship) do
  leader_id { Fabricate(:person).id }
  follower_id { Fabricate(:person).id }

end
