require 'spec_helper'


describe 'install directory' do
  describe file '/opt/thalassa' do
    it { should be_directory }
    it { should be_owned_by 'thalassa' }
    it { should be_grouped_into 'thalassa' }
  end
end
