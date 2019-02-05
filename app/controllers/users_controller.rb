class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = "転職希望者情報を更新しました"
      redirect_to @user
    else
      flash.now[:danger] = "転職希望者情報を更新できませんでした"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    flash[:success] = "転職希望者を削除しました"
    redirect_back(fallback_location: user_path)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:image, :name, :sex, :birthday, :address, :telephone, :email, :academic_background, :resume_file, :career_file)
  end
end
