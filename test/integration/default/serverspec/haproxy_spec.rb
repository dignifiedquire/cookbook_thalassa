require 'spec_helper'


describe 'haproxy installation' do
  describe package 'haproxy' do
    it { should be_installed }
  end
end
