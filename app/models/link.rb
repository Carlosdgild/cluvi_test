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
class Link < ApplicationRecord
  validates :url, :counter, :alexa_rank, presence: true
  validates :short_code, presence: true, uniqueness: { case_sensitive: false }
  validate :url_format

  def url_format
    errors.add(:url, "Invalid URL") if URI.parse(url.presence || "").host.blank?
  end
end
