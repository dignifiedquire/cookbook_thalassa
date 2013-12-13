require 'spec_helper'


describe 'thalassa crowsnest' do
  # npm module
  describe file '/opt/thalassa/node_modules/.bin/thalassa-crowsnest' do
    it { should be_file }
    it { should be_owned_by 'thalassa' }
  end

  describe file '/etc/init/thalassa-crowsnest.conf' do
    it { should be_file }
    its :content do
      should include 'setuid thalassa'
      should include 'setgid thalassa'
      should include 'CMD=/opt/thalassa/node_modules/.bin/thalassa-crowsnest'
      should include 'CMD="$CMD --host 127.0.0.1"'
    end
  end

  describe service 'thalassa-crowsnest' do
    it { should be_running }
  end
end
