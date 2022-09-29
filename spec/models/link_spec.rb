# frozen_string_literal: true

require "rails_helper"

RSpec.describe Link, type: :model do
  subject(:link) { create(:link) }

  describe "validations" do
    it do
      expect(link).to validate_presence_of(:url)
      expect(link).to validate_presence_of(:short_code)
      expect(link).to validate_presence_of(:alexa_rank)
      expect(link).to validate_presence_of(:counter)
    end
  end


  describe "associations" do
    it do
      expect(link).to have_db_index(:short_code).unique(true)
    end
  end

  it "validates short_code uniqueness" do
    # creates valid records
    expect do
      create :link
      create :link
    end.not_to raise_error
    # create invalid record
    expect do
      create :link, short_code: 123_456
      create :link, short_code: 123_456
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
