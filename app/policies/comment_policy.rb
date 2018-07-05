class CommentPolicy < ApplicationPolicy
  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
