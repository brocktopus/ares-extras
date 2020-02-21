module AresMUSH
  module Skills
    class SkillsCmd
      include CommandHandler
                
      attr_accessor :name
            
      def parse_args
        self.name = cmd.args || enactor_name
      end
      
      def handle
        ClassTargetFinder.with_a_character(self.name, client, enactor) do |model|
          template = SkillsTemplate.new(model, model.skills || {})
          client.emit template.render     
        end
      end
    end
  end
end
