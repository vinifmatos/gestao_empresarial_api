class ApplicationController < ActionController::API
  after_action :set_header

  def set_header
    response.set_header 'Access-Control-Expose-Headers', 'Total, Per-page'
  end
end
