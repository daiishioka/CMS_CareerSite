class RecruitsController < ApplicationController
  def show
    @recruit = Recruit.find(params[:id])
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
    params.require(:recruit).permit(:title, :recruitment_background, :job_description, :requirement, :selection_process)
  end
end
