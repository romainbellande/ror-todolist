class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :board
end
