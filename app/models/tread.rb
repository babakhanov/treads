class Tread < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :messages

  def self.list(user_id)
    Tread.includes(:users).joins(:treads_users).where("treads_users.user_id" => user_id)
  end
end
