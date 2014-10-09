require 'resume_parser/name_extractor'
require 'resume_parser/email_extractor'

module ResumeParser
  class Resume

    attr_accessor :full_name, :text

    def initialize(text)
      @text = text
    end

    def full_name
      NameExtractor.new(text).full_name
    end

    def email_address
      EmailExtractor.new(text).email_address
    end

  end
end
