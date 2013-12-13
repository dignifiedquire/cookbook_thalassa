require 'spec_helper'


describe 'haproxy installation' do

  describe user 'haproxy' do
    it { should exist }
    it { should belong_to_group 'haproxy' }
  end

  describe package 'haproxy' do
    it { should be_installed }
  end
end
