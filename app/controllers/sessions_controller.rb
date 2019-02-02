class SessionsController < ApplicationController
  def new
  end

  def create
    name = params[:session][:name]
    password = params[:session][:password]
    if login(name, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private

  def login(name, password)
    @admin = Admin.find_by(name: name)
    if @admin && @admin.authenticate(password)
      session[:admin_id] = @admin.id
      return true
    else
      return false
    end
  end
  
end
