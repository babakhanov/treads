class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    unless user.new_record?
      can :create, Message
    end
  end
end
