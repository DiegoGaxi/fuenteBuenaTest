class Cliente
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :id, type: Integer

  validates_presence_of :name
  # has_many :loans
end
