class BoardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :todos
end
