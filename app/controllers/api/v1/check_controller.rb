module Api
  module V1
    class CheckController < Api::V1::ApplicationController
      before_action :authenticate_api_member!

      def index
        render json: { message: "ok!" }, status: :ok
      end
    end
  end
end
