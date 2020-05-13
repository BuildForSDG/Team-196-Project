class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler

    before_action :authorize_request
    attr_reader :current_user

    private

    def authoriza_request
        @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end
end
