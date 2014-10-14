require 'resume_parser/name_extractor'
require 'resume_parser/email_extractor'
require 'resume_parser/phone_number_extractor'
require 'resume_parser/job_history_extractor'

module ResumeParser
  class Resume

    attr_accessor :text

    def initialize(text)
      @text = text.delete('•').gsub(/\u00a0/, ' ')
    end

    def full_name
      NameExtractor.new(text).full_name
    end

    def email_address
      EmailExtractor.new(text).email_address
    end

    def phone_numbers
      PhoneNumberExtractor.new(text).phone_numbers
    end

  end
end
