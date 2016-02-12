class RacerInfo
  include Mongoid::Document
  
  field :racer_id, as: :_id
  field :_id, default: -> { racer_id }
  
  field :fn, as: :first_name, type: String
  field :ln, as: :last_name, type: String
  field :g, as: :gender, type: String
  field :yr, as: :birth_year, type: Integer
  field :res, as: :residence, type: Address
  
  embedded_in :parent, polymorphic: true
  
  validates :first_name, 
    presence: true
    
  validates :last_name, 
    presence: true
  
  validates :gender, 
    presence: true, 
    inclusion: { in: [ 'M', 'F' ], message: 'must be M or F' }
    
  validates :birth_year, 
    presence: true, 
    numericality: { less_than: Time.now.year, message: 'must be in the past'} 
  
  ["city", "state"].each do |action|
    define_method("#{action}") do 
      self.residence ? self.residence.send("#{action}") : nil
    end
    
    define_method("#{action}=") do |name|
      object = self.residence ||= Address.new
      object.send("#{action}=", name)
      self.residence = object
    end
  end
end
