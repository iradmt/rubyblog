class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
        can [:read, :destroy], :all
        can :create, [Article, Comment]
        can :update, User, :id => user.id
        can :update, User, :role => { :name => "user" }
    else
        if user.has_role? :user
            can :read, :all
            can :create, Article
            can [:update, :destroy], Article, :user_id => user.id
            can [:create, :destroy], Comment, :user_id => user.id
            can [:update, :destroy], User, :id => user.id
        else
            can :read, :all
        end
    end
  end
end
