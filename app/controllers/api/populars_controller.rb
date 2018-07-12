class API::PopularsController < API::APIController
  def show
    @users = User.joins(:answers).order('answers.views_count desc').limit(10)
  end
end
