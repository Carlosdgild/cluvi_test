# frozen_string_literal: true

#
# Main Application Service class wrapper
# Services should perform some kind of error handling and return the data (if any) with the boolean indicating if an error occurred
#
class ApplicationService
  #
  # Wrapper for new services to call directly perform
  #
  def self.perform(...)
    new(...).perform
  end

  # :reek:UtilityFunction
  def log_message(level = :info, message = "")
    Rails.logger.public_send(level, message)
  end
end
