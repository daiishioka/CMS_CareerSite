class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
  
  def show
    @company = Company.find(params[:id])
  end
  
  def new
  end
  
  def create
  end
  
  def edit
    @company = Company.find(params[:id])
  end

  def update
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    
    flash[:success] = '企業を削除しました。'
    redirect_to companies_url
  end
  
end
