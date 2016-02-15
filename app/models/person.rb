class Person < ActiveRecord::Base
  has_many :images
  has_many :leading_relationships, class_name: "Relationship", foreign_key: :leader_id # all of the people following self
  has_many :following_relationships, class_name: "Relationship", foreign_key: :follower_id # all of the people self is following
  validates_presence_of :email, :password_digest
  has_secure_password

  def follow(person)
    following_relationships.create(leader: person) if can_follow?(person) 
  end

  def followers
    leading_relationships.map(&:follower)
  end

  def can_follow?(person)
    relationships = following_relationships.map(&:leader)
    if relationships.include?(person) || self ==  person
      false
    else
      true
    end
  end

end
