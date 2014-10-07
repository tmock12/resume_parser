require "resume_parser/resume"
require "yomu"

module ResumeParser
  class FileReader

    attr_accessor :resume

    def initialize(file)
      @resume = Resume.new(read_file(file))
    end

    private

    def read_file(file)
      @read_file ||= ::Yomu.read(:text, file)
    end

  end
end
