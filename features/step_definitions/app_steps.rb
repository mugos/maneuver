Given /^I am a logged user, at the new_app page$/ do
  # Get user
  pending
end

Given /^I fill in app data (.+)$/ do |data|
  app = App::Create[thing:{
    name: data.name,
    template: data.template,
    git: data.git,
    user: @user
  }].model
end

Then /^I save$/ do
  pending
end
