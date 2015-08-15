class TreadSerializer <  ActiveModel::Serializer
  attributes :id
  has_many :users
  has_many :messages

  def messages
    object.messages.order(created_at: :asc)
  end
end

