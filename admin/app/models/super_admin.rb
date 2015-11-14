class SuperAdmin
  authenticates_with_sorcery!

  include Mongoid::Document

  field :email, type: String
  field :username, type: String
  field :crypted_password, type: String 
  field :salt, type: String  
  
end
