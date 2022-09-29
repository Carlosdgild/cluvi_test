# frozen_string_literal: true

# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  alexa_rank :integer          default(0), not null
#  counter    :integer          default(0), not null
#  short_code :string(7)        not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_links_on_short_code  (short_code) UNIQUE
#
FactoryBot.define do
  factory :link do
    url { "http://www.youtube.com" }
    short_code { generate(:short_code) }
    counter { 0 }
    alexa_rank { 0 }
  end
end
