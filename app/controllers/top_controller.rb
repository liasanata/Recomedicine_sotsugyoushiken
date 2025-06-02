class TopController < ApplicationController

  def index
    # もしリクエストがGETメソッドであれば、params[:problem_check]を確認する
    if params[:problem_check]
      if params[:problem_check].include?('1')
        redirect_to controller: 'problems_check', action: 'recommendation_for_medical_examination' and return
      elsif params[:problem_check].include?('2')
        redirect_to controller: 'problems_check', action: 'precautions' and return
      end
    end
    # どちらの条件にも当てはまらなければ、症状入力画面を表示する
    render :index
  end

end
