require 'spec_helper'


describe 'git installation' do
  describe package 'git' do
    it { should be_installed }
  end
end
