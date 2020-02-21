module AresMUSH
  module Skills
    class SkillsTemplate < ErbTemplateRenderer
      
      attr_accessor :char, :skills
      
      def initialize(char, skills)
        @char = char
        @skills = skills
        super File.dirname(__FILE__) + "/skills.erb"
      end
    end
  end
end
