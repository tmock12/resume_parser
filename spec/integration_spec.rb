require 'spec_helper'

shared_examples "a parsed resume" do

  subject do
    ResumeParser.parse(File.read("spec/fixtures/#{resume[:file]}"))
  end

  it "returns a parsed full name" do
    expect(subject.full_name).to eq(resume[:full_name])
  end

end

describe ResumeParser do

  describe "docx" do
    it_behaves_like "a parsed resume" do
      let(:resume) do
        {
          file: "word_resume.docx",
          full_name: "John J. Doe"
        }
      end
    end
  end

  describe "doc" do
    it_behaves_like "a parsed resume" do
      let(:resume) do
        {
          file: "word_resume_doc.doc",
          full_name: "john smith"
        }
      end
    end
  end

  describe "pdf_resume" do
    it_behaves_like "a parsed resume" do
      let(:resume) do
        {
          file: "pdf_resume.pdf",
          full_name: "Joe Sak"
        }
      end
    end
  end

end
