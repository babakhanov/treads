class UserTinySerializer < ActiveModel::Serializer
  attributes :id
end

class TreadTinySerializer < ActiveModel::Serializer
  has_many :users, each_serializer: UserTinySerializer
end

class MessageRespSerializer <  ActiveModel::Serializer
  attributes :id, :user_id, :text, :created_at, :tread_id
  has_one :tread, serializer: TreadTinySerializer
end
