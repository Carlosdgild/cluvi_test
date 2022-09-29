# frozen_string_literal: true

module Sequences
  module ShortCode
    module_function

    def short_code(number = SecureRandom.uuid[0..6])
      number.to_s
    end
  end
end
