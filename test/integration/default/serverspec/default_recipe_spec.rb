require 'spec_helper'

describe 'default recipe' do

  describe user 'thalassa' do
    it { should exist }
    it { should belong_to_group 'thalassa' }
  end

end

