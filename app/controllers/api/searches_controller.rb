class API::SearchesController < API::APIController
  skip_before_action :restrict_access!, only: [:show]

  def show
    @questions = Question.where('content ILIKE ?', "%#{params[:search]}%").includes(:answer, :upvotes)
    @users = User.where("(first_name || ' ' || last_name) ILIKE ?", "%#{params[:search]}%").with_attached_avatar
  end
end
