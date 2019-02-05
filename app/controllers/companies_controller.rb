class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
  
  def show
    @company = Company.find(params[:id])
    
    @recruit = @company.recruits.build
    @recruits = @company.recruits.order('created_at DESC').page(params[:page])
    
    @member = @company.members.build
    @members = @company.members.order('created_at DESC').page(params[:page])
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
