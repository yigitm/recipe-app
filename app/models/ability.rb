class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all # start by defining rules for all users, also not logged ones

    return unless user.present?

    can :manage, Recipe, user_id: user.id
  end
end
