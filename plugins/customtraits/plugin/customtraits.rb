$:.unshift File.dirname(__FILE__)

module AresMUSH
  module CustomTraits
    def self.plugin_dir
      File.dirname(__FILE__)
    end
 
    def self.shortcuts
      Global.read_config("customtraits", "shortcuts")
    end
    
    def self.traits_by_category(char)
#      trait_type = char.traits.group_by.map { |name, data| data['category'] }
      trait_type = char.traits.sort do |a, b|
        a.category.upcase <=> b.category.upcase
      trait_type.sort_by { |category, trait_type| CustomTraits.category_order(char, category) }
    end
    
    def self.category_order(char, category)
      char.traits_category_order.map { |r| r.upcase }.index(category.upcase) || (category[0] || "1").ord
    end
 
    def self.get_cmd_handler(client, cmd, enactor)
      case cmd.root
      when "trait"
        case cmd.switch
        when "set"
          return SetTraitCmd
        when "remove"
          return RemoveTraitCmd
        else
          return TraitsCmd
        end
      end
      
      nil
    end
  end
end
