class Admin::CategoriesController < ApplicationController
    http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

    def index
        @categories = Category.order(:name).all
    end
end