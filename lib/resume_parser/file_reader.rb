require "resume_parser/resume"
require "yomu"

module ResumeParser
  class FileReader

    attr_accessor :file, :resume

    def initialize(file)
      @file = file
      @resume = resume
    end

    def resume
      @resume ||= Resume.new(read_file)
    end

    private

    def read_file
      @read_file ||= ::Yomu.read(:text, file)
    end

  end
end
