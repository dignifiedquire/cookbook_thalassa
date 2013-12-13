require 'spec_helper'

describe 'redis installation' do
  describe package 'redis-server' do
    it { should be_installed }
  end
end
