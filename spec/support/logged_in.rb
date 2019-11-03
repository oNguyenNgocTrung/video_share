RSpec.configure do |config|
  config.before(:each, logged_in: true) do
    login_as(user)
  end
end

def user
  @user ||= FactoryBot.build(:user)
  @user.save!
  @user
end

def login_as(user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
end
