# frozen_string_literal: true

module Sequences
  module Url
    module_function

    def url(number = SecureRandom.random_number(100))
      "www.cluvi_test_#{number}.com"
    end
  end
end
