class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, Tread do |tread|
      tread.users.map(&:id).include?(user.id)
    end
    unless user.new_record?
      can :create, Message
    end
  end
end
