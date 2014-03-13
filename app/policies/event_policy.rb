class EventPolicy < ApplicationPolicy
#  class Scope < Struct.new(:user, :scope)
#    def resolve
#      scope
#    end
#  end

  attr_reader :user, :event

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end

end
