class QuestionPolicy < ApplicationPolicy
  def destroy?
    record.respondent == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
