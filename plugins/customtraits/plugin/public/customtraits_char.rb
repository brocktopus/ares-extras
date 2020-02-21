module AresMUSH
  class Character < Ohm::Model
    collection :traits, "AresMUSH::SingleTrait"

    attribute :traits_category_order, :type => DataType::Array, :default => []
#    original one-line model info below
#    attribute :traits, :type => DataType::Hash, :default => {}
  end
  
  class SingleTrait < Ohm::Model
    include ObjectModel
    
    attribute :name
    attribute :category
    attribute :description
    reference :character, "AresMUSH::Character"
    index :name    
  end
  
end
