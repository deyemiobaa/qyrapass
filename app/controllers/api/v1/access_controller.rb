module Api
  module V1
    class AccessController < Api::V1::ApplicationController
      before_action :authenticate_api_member!

      def create
        user = current_api_member

        if is_active_member?
        render json: { message: "Access granted", name: user.name }
        else
          render json: { error: "Access Denied", name: user.name }, status: :forbidden
        end
      end

      def is_active_member?
        current_api_member.is_active && current_api_member.access_expiry_date > Time.now
      end
    end
  end
end
