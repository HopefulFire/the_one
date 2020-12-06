class ChatsController < ApplicationController
  def index; end

  private

  def find_user
    @user = current_user
  end
end
