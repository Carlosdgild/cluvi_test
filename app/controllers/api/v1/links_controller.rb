# frozen_string_literal: true

module Api
  module V1
    #
    # Main Links controller class
    #
    class LinksController < ApplicationController
      def show
        head
      end

      def create
        data, error = ShortenerService::ShortenUrlService.perform links_params[:url]

        if error
          render_error_response('An error has occurred', :unprocessable_entity, :invalid_error, data)
        else
          render_response(data: data, status_code: :ok, serializer: nil, meta: nil)
        end
      end

      private

      def links_params
        params.permit(:link).permit(
          :url
        )
      end
    end
  end
end
