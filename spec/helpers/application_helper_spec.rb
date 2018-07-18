require 'rails_helper'

describe ApplicationHelper do
  describe 'flash_class' do
    it "notice level is 'alert alert-info'" do
      expect(helper.flash_class('notice')).to eq 'alert alert-info'
    end

    it "success level is 'alert alert-success'" do
      expect(helper.flash_class('success')).to eq 'alert alert-success'
    end

    it "error level is 'alert alert-danger'" do
      expect(helper.flash_class('error')).to eq 'alert alert-danger'
    end

    it "alert level is 'alert alert-danger'" do
      expect(helper.flash_class('alert')).to eq 'alert alert-danger'
    end

    it "other level is 'alert alert-info'" do
      expect(helper.flash_class('other')).to eq 'alert alert-info'
    end
  end
end
