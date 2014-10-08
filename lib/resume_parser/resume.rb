require 'resume_parser/name_extractor'

module ResumeParser
  class Resume

    attr_accessor :full_name, :text

    def initialize(text)
      @text = text
    end

    def full_name
      NameExtractor.new(text).full_name
    end
  end
end
