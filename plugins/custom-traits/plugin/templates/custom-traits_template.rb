module AresMUSH
  module Custom-Traits
    class TraitsTemplate < ErbTemplateRenderer
      
      attr_accessor :char, :traits
      
      def initialize(char, traits)
        @char = char
        @traits = traits
        super File.dirname(__FILE__) + "/traits.erb"
      end
      
      def categories
        Custom-Traits.traits_by_category(category)
      end
      
      def sorted_relationships(category)
        category.sort_by { |name, desc| [ desc['order'] || 99, name ] }
      end
    end
  end
end
