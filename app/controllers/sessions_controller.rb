class SessionsController < ApplicationController
  def create
    @user = User.first_or_create(name: auth['name'], uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.uid = auth['info']['uid']
    end

    session[:user_id] = @user.id

    render 'welcome/home'
  end

  #solution
  #def create
  #  user = User.find_or_create_by(:uid => auth['uid']) do |user|
  #    user.name = auth['info']['name']
  #  end
  #  session[:user_id] = user.try(:id)
  #end

  private

  def auth
    request.env['omniauth.auth']
  end
end
