require 'spec_helper'


describe 'Node.js' do

  describe command 'node --version' do
    it { should return_stdout /v0\.10\.\d{2}/ }
  end

  describe command 'npm --version' do
    it { should return_stdout /1\.3\.\d{2}/ }
  end

end

