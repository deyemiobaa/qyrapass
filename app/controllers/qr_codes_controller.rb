class QrCodesController < ApplicationController
  before_action :authenticate_admin!

  def index
    content = api_v1_access_index_path

    # For PNG image
    @qr_png = RQRCode::QRCode.new(content).as_png

    # For SVG image
    @qr_svg = RQRCode::QRCode.new(content).as_svg
  end
end
