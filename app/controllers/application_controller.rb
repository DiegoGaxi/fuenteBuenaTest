class ApplicationController < ActionController::Base

    def index
        
    end

    def about
        render json: { message: 'Hello World' }
    end

end
