class RelationshipsController < ApplicationController
  before_action :authenticate_person!

  def index
    @relationships = current_person.following_relationships
  end

  def create
    leader = Person.find_by_id(params[:leader_id])

    if current_person.follow(leader)
      redirect_to  :back, notice: "You are now following #{leader.email}"
    else
      redirect_to :back
    end
  end

  def destroy
    relationship = Relationship.find(params[:id])
    relationship.destroy if current_person ==  relationship.follower
    redirect_to :back, notice: "You are no longer following #{relationship.leader.email}"
  end

end
