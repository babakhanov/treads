class TreadSerializer <  ActiveModel::Serializer
  attributes :id
  has_many :users
  has_many :messages
end

