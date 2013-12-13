require 'spec_helper'


describe 'thalassa aqueduct' do
  # npm module
  describe file '/opt/thalassa/node_modules/.bin/thalassa-aqueduct' do
    it { should be_file }
    it { should be_owned_by 'thalassa' }
  end

  describe service 'thalassa-aqueduct' do
    it { should be_running }
  end
end
