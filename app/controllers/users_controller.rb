class UsersController < ApplicationController
  def index
    @users = User.all
      if params[:prefecture_id].present? && params[:search]
        @users = @users.where(prefecture_id: params[:prefecture_id]).search(params[:search])
      elsif params[:prefecture_id].present? || params[:search]
        @users = @users.where(prefecture_id: params[:prefecture_id]).or(@users.search(params[:search]))
      end
      
      if params[:sex].present? && params[:search]
        @users = @users.where(sex: params[:sex]).search(params[:search])
      elsif params[:sex].present? || params[:search]
        @users = @users.where(sex: params[:sex]).or(@users.search(params[:search]))
      end
      
      if params[:tag_id].present? && params[:search]
        @users = Tag.find(params[:tag_id]).users.search(params[:search])
      elsif params[:tag_id].present? || params[:search]
        @users = Tag.find(params[:tag_id]).users.or(@users.search(params[:search]))
      end
      
    @users = @users.page(params[:page]).order('created_at DESC').per(5)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '転職希望者を登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = '転職希望者の登録に失敗しました。'
      render :new
    end
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
    redirect_to "/users"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:image, :name, :sex, :birthday, :address, :telephone, :email, :academic_background, :resume_file, :career_file, :password, :password_confirmation, :age, :accepted, :selfpr, :prefecture_id, :certification, tag_ids: [])
  end
  
end
