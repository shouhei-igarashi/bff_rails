module Api
    module V1
        class PostsController < ApplicationController
            def index
                render json: { status: 'SUCCESS', message: 'Loaded posts' }
            end
        end
    end
end
