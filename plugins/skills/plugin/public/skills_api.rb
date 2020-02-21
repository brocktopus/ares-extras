module AresMUSH
  module Skills
    def self.save_char(char, chargen_data)
      skills = {}
      (chargen_data[:skills] || {}).each do |name, desc|
        skills[name.titlecase] = Website.format_input_for_mush(desc)
      end
      char.update(skills: skills)
      return []
    end
    
    def self.get_skills_for_web_viewing(char, viewer)
      char.skills.map { |name, desc| {
        name: name,
        desc: Website.format_markdown_for_html(desc)
      }}
    end
    
    def self.get_skills_for_web_editing(char, viewer)
      char.skills.map { |name, desc| {
        name: name,
        desc: Website.format_input_for_html(desc)
      }}
    end
  end
end
