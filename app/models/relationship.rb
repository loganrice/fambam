class Relationship < ActiveRecord::Base
  belongs_to :leader, class_name: "Person"
  belongs_to :follower, class_name: "Person"
end
