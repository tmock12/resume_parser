require "resume_parser/version"
require "resume_parser/file_reader"

module ResumeParser

  def self.parse(file)
    FileReader.new(file).resume
  end

end
