module ResumeParser
  class PhoneNumberExtractor

    attr_accessor :text, :phone_numbers

    def initialize(text)
      @text = text
    end

    def phone_numbers
      {}.tap do |h|
        h[:home]    = phone_number_for(:home)
        h[:work]    = phone_number_for(:work)
        h[:mobile]  = phone_number_for([:mobile, :cell])
        h[:phone]   = any_found_phone_number
      end.reject { |x,v| v.nil? || v.empty? }
    end

    private

    def any_found_phone_number
      text[phone_number_regex]
    end

    def phone_number_for(labels)
      text.scan(/(?i-mx:(#{Array[labels].flatten.join("|")}):?)\s+#{phone_number_regex}/).flatten[1]
    end

    def phone_number_regex
      /((\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4})/
    end
  end
end
