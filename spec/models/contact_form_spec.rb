require 'spec_helper'

describe ContactForm do
  it { should have_valid(:email).when('test@test.com', 'test+spam@gmail.com') }
  it { should_not have_valid(:email).when('', nil) }

  it { should have_valid(:first_name).when('TestName') }
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('TestName') }
  it { should_not have_valid(:last_name).when('', nil) }

  it { should have_valid(:subject).when('dog help') }
  it { should_not have_valid(:subject).when('', nil) }

  it { should have_valid(:description).when('this is my description') }
  it { should_not have_valid(:description).when('', nil) }
end
