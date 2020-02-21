$:.unshift File.dirname(__FILE__)

module AresMUSH
  module Resources
    def self.plugin_dir
      File.dirname(__FILE__)
    end
 
    def self.shortcuts
      Global.read_config("resources", "shortcuts")
    end
 
    def self.get_cmd_handler(client, cmd, enactor)
      case cmd.root
      when "resource"
        case cmd.switch
        when "set"
          return SetResourceCmd
        when "remove"
          return RemoveResourceCmd
        else
          return ResourcesCmd
        end
      end
      
      nil
    end
  end
end
