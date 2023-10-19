# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    user ||= User.new
    can :read, :all
    return unless user.present?
    can :manage, Recipe, user_id: user.id # if the user is logged in can manage it's own posts
    can :manage, Food, user_id: user.id # logged in users can also create comments
    can :manage, RecipeFood, user_id: user.id # logged in users can also create comments
  end
end
