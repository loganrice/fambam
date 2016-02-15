require 'rails_helper'

describe Person do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password_digest }
  it { should have_many :images }
  it { should have_many :leading_relationships }
  it { should have_many :following_relationships }

  describe '.follow' do
    it 'allows a person to follow another person' do
      john = Fabricate(:person)
      jane = Fabricate(:person)

      john.follow jane

      expect(jane.followers).to include(john)
    end

    it "does not allow a person to follow themselves" do
      john = Fabricate(:person)

      john.follow john

      expect(john.followers).not_to include(john)
    end

    it "does not follow the same person twice" do
      john = Fabricate(:person, email: "john@example.com")
      jane = Fabricate(:person, email: "jane@example.com")

      john.follow jane
      john.follow jane

      expect(jane.followers.count).to eq(1)
    end
  end

end
