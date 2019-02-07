class CompaniesController < ApplicationController
  def index
    @companies = Company.all.page(params[:page]).per(5)
  end
  
  def new
    @company = Company.new
  end 
  
  def create
    @company = Company.new(company_params)
    
    if @company.save
      flash[:success] = '転職希望者を登録しました。'
      redirect_to @company
    else
      flash.now[:danger] = '転職希望者の登録に失敗しました。'
      render :new
    end
  end
  
  def show
    @company = Company.find(params[:id])
    
    @recruit = @company.recruits.build
    @recruits = @company.recruits.order('created_at DESC').page(params[:page]).per(2)
    
    @member = @company.members.build
    @members = @company.members.order('created_at DESC').page(params[:page]).per(2)
  end
  
  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    
    if @company.update(company_params)
      flash[:success] = '企業情報を更新しました'
      redirect_to @company
    else
      flash.now[:danger] = "企業情報の更新に失敗しました"
      render :edit
    end
      
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    
    flash[:success] = '企業を削除しました。'
    redirect_back(fallback_location: company_path)
  end
  
  private

  def company_params
    params.require(:company).permit(:name, :ceo, :employees, :capital_stock, :headquarter_address, :homepage, :telephone, :established_yearmonth, :image)
  end
  
end
