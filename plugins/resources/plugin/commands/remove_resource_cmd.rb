module AresMUSH
  module Resources
    class RemoveResourceCmd
      include CommandHandler
                
      attr_accessor :name, :resource_name
            
      def parse_args
        if (Chargen.can_approve?(enactor) && cmd.args =~ /.+=.+/)
          args = cmd.parse_args(ArgParser.arg1_equals_arg2)
          
          self.name = titlecase_arg(args.arg1)
          self.resource_name = titlecase_arg(args.arg2)
        else
          self.name = enactor_name
          self.resource_name = titlecase_arg(cmd.args)
        end
      end
      
      def required_args
        [ self.name, self.resource_name ]
      end
      
      def handle
        ClassTargetFinder.with_a_character(self.name, client, enactor) do |model|
          if (enactor.name == model.name || Chargen.can_approve?(enactor))
            resources = model.resources || {}
            resources.delete self.resource_name
            model.update(resources: resources)
            client.emit_success t('resources.resource_removed')
          else
            client.emit_failure t('dispatcher.not_allowed')
          end
                    
        end
      end
    end
  end
end
