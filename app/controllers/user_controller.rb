class UserController < ApplicationController
    before_action :authenticate_user!, only: [:index]
end