class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end
  
  def new
    @company = Company.find(params[:company_id])
    @member = Member.new(company_id: @company.id)
  end

  def create
    @member = Member.new(member_params)
    
    if @member.save
      flash[:success] = '転職希望者を登録しました。'
      redirect_to @member
    else
      flash.now[:danger] = '転職希望者の登録に失敗しました。'
      render :new
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    
    if @member.update(member_params)
      flash[:success] = "担当者情報を更新しました"
      redirect_to @member
    else
      flash.now[:danger] = "担当者情報を更新できませんでした"
      render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    
    flash[:success] = "担当者を削除しました"
    redirect_back(fallback_location: company_path)
  end
  
  private
  
  def member_params
    params.require(:member).permit(:name, :sex, :telephone, :email, :belonged_company, :company_id, :password, :password_confirmation)
  end
end
