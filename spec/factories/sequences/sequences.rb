# frozen_string_literal: true

FactoryBot.define do
  sequence(:url) do |n|
    Sequences::Url.url(n)
  end

  sequence(:short_code) do |n|
    Sequences::ShortCode.short_code(n)
  end
end
