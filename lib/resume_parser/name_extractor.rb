require 'resume_parser/common_names'

module ResumeParser
  class NameExtractor

    attr_accessor :text

    def initialize(text)
      @text = text
    end

    def full_name
      text[full_name_regexp].strip
    end

    private

    def full_name_regexp
      /\b#{common_first_name_regexp}\s(((.\.)\s(\w+))|(\(?\w+)?\)?)[ \t]?([A-Z]\w+)?/
    end

    def common_first_name_regexp
      Regexp.new(Regexp.union(CommonNames::FIRST).source, "i")
    end

  end
end
