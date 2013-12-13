require 'spec_helper'


describe 'thalassa server' do
  # npm module
  describe file '/opt/thalassa/node_modules/.bin/thalassa-server' do
    it { should be_file }
    it { should be_owned_by 'thalassa' }
  end

  describe service 'thalassa' do
    it { should be_running }
  end
end
