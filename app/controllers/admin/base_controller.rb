class Admin::BaseController < ApplicationController
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV['ADMIN_BASIC_AUTH_NAME'], password: ENV['ADMIN_BASIC_AUTH_PASSWORD']
end
