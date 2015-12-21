class Domain 
  include Mongoid::Document
  
  field :name, type: String
  field :quota, type: Integer
  field :quotamax, type: Integer

  has_many:users
  has_many :administrators
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :quota, :quotamax


  def after_initialize
    if new_record?
      self.quota = 5000
      self.quotamax = 10000
    end
  end

  def user_count
    self.users.count
  end

end
