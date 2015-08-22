class TreadShortSerializer <  ActiveModel::Serializer
  attributes :id, :new_msg
  has_many :users
  def new_msg
    0
  end
end
