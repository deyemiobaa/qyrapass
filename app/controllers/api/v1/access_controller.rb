module Api
  module V1
    class AccessController < Api::V1::ApplicationController
      before_action :authenticate_api_member!

      def create
        user = current_api_member

        if is_active_member?
          user.update(last_signed_in: Time.now)
          broadcast_to_qr_codes(
            "Welcome #{user.name}! you've been granted access.",
            "success"
          )
          render json: { message: "Access granted", name: user.name }
        else
          broadcast_to_qr_codes(
            "Oops #{user.name}! you are denied access.",
            "error"
          )
          render json: { error: "Access Denied", name: user.name }, status: :forbidden
        end
      end

      def is_active_member?
        current_api_member.is_active && current_api_member.access_expiry_date > Time.now
      end

      def broadcast_to_qr_codes(message, status)
        Turbo::StreamsChannel.broadcast_update_to(
          "qr_code_channel",
          target: "toast_notifications",
          partial: "qr_codes/toast",
          locals: { message: message, status: status }
        )
      end
    end
  end
end
