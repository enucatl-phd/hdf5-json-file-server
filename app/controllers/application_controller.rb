class ApplicationController < ActionController::API
    include ActionController::MimeResponds

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
end
