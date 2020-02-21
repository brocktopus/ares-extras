$:.unshift File.dirname(__FILE__)

module AresMUSH
  module Skills
    def self.plugin_dir
      File.dirname(__FILE__)
    end
 
    def self.shortcuts
      Global.read_config("skills", "shortcuts")
    end
 
    def self.get_cmd_handler(client, cmd, enactor)
      case cmd.root
      when "skill"
        case cmd.switch
        when "set"
          return SetSkillCmd
        when "remove"
          return RemoveSkillCmd
        else
          return SkillsCmd
        end
      end
      
      nil
    end
  end
end
