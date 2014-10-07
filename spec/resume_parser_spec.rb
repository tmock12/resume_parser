require 'spec_helper'

describe ResumeParser do

  describe ".parse" do
    it "returns a resume object" do
      expect(ResumeParser.parse("bla")).to be_a(ResumeParser::Resume)
    end
  end
end
