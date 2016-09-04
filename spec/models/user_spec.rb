require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "#create" do
    it "success" do
      user = User.create(name: "kekekenta")
      expect(user.name).to eq "kekekenta"
    end
  end
end
