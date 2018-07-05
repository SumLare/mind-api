class API::SearchesController < API::APIController
  def show
    @questions = Question.where('content ILIKE ?', "%#{params[:search]}%")
    @users = User.where("concat(first_name, ' ', last_name) ILIKE ?", "%#{params[:search]}%")
  end
end
