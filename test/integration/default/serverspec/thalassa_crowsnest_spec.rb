require 'spec_helper'


describe 'thalassa crowsnest' do
  # npm module
  describe file '/opt/thalassa/node_modules/.bin/thalassa-crowsnest' do
    it { should be_file }
    it { should be_owned_by 'thalassa' }
  end

  describe service 'thalassa-crowsnest' do
    it { should be_running }
  end
end
