class RecruitsController < ApplicationController
  def show
    @recruit = Recruit.find(params[:id])
  end
  
  def new
    @recruit = Recruit.new
  end
  
  def create
    @recruit = Recruit.new(recruit_params)
    
    if @recruit.save
      flash[:success] = '新規求人情報を登録しました。'
      redirect_to @recruit
    else
      flash.now[:danger] = '新規求人情報の登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @recruit = Recruit.find(params[:id])
  end

  def update
    @recruit = Recruit.find(params[:id])
    if @recruit.update(recruit_params)
      flash[:success] = "求人情報を更新しました"
      redirect_to @recruit
    else
      flash.now[:danger] = "求人情報の更新に失敗しました"
      render :edit
    end
      
  end

  def destroy
    @recruit = Recruit.find(params[:id])
    @recruit.destroy
    
    flash[:success] = "求人情報を削除しました"
    redirect_back(fallback_location: company_path)
  end
  
  private
  
  def recruit_params
    params.require(:recruit).permit(:title, :recruitment_background, :job_description, :requirement, :selection_process, :company_id)
  end
end
