module AresMUSH
  module Resources
    def self.save_char(char, chargen_data)
      resources = {}
      (chargen_data[:resources] || {}).each do |name, desc|
        resources[name.titlecase] = Website.format_input_for_mush(desc)
      end
      char.update(resources: resources)
      return []
    end
    
    def self.get_resources_for_web_viewing(char, viewer)
      char.resources.map { |name, desc| {
        name: name,
        desc: Website.format_markdown_for_html(desc)
      }}
    end
    
    def self.get_resources_for_web_editing(char, viewer)
      char.resources.map { |name, desc| {
        name: name,
        desc: Website.format_input_for_html(desc)
      }}
    end
  end
end
