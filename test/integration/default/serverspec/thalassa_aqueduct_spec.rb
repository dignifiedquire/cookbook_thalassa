require 'spec_helper'


describe 'thalassa aqueduct' do
  # npm module
  describe file '/opt/thalassa/node_modules/.bin/thalassa-aqueduct' do
    it { should be_file }
    it { should be_owned_by 'thalassa' }
  end

  # Template file
  describe file '/opt/thalassa/default.haproxycfg.tmpl' do
    it { should be_file }
    it { should be_owned_by 'thalassa' }
  end

  describe file '/etc/init/thalassa-aqueduct.conf' do
    it { should be_file }
    its :content do
      should include 'setuid thalassa'
      should include 'setgid thalassa'
      should include 'CMD=/opt/thalassa/node_modules/.bin/thalassa-aqueduct'
      should include 'CMD="$CMD --host 127.0.0.1"'
      should_not include 'CMD="$CMD --sudo"'
    end
  end

  describe service 'thalassa-aqueduct' do
    it { should be_running }
  end

end
