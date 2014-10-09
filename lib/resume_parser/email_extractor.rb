module ResumeParser
  class EmailExtractor

    attr_accessor :text, :email_address

    def initialize(text)
      @text = text
    end

    def email_address
      text[/\S+@\S+/]
    end
  end
end
