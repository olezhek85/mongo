class Visitor
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :reason, type: String
end
