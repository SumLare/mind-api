class API::SearchesController < API::APIController
  skip_before_action :restrict_access!, only: [:show]

  def show
    @questions = Question.where('content ILIKE ?', "%#{params[:search]}%")
    @users = User.where("concat(first_name, ' ', last_name) ILIKE ?", "%#{params[:search]}%")
  end
end
