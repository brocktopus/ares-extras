module AresMUSH
  module Resources
    class ResourcesTemplate < ErbTemplateRenderer
      
      attr_accessor :char, :resources
      
      def initialize(char, resources)
        @char = char
        @resources = resources
        super File.dirname(__FILE__) + "/resources.erb"
      end
    end
  end
end
