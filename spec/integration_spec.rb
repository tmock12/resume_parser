require 'spec_helper'

shared_examples "a parsed resume" do

  subject do
    ResumeParser.parse(File.read("spec/fixtures/#{resume[:file]}"))
  end

  it "returns a parsed full name" do
    expect(subject.full_name).to eq(resume[:full_name])
  end

  it "returns a parsed email address" do
    expect(subject.email_address).to eq(resume[:email])
  end

end

describe ResumeParser do

  describe "docx" do
    it_behaves_like "a parsed resume" do
      let(:resume) do
        {
          file: "word_resume.docx",
          full_name: "John J. Doe",
          email: "joe@bla.com"
        }
      end
    end
  end

  describe "doc" do
    it_behaves_like "a parsed resume" do
      let(:resume) do
        {
          file: "word_resume_doc.doc",
          full_name: "john smith",
          email: "j.smith@johnsmith.com"
        }
      end
    end

    it_behaves_like "a parsed resume" do
      let(:resume) do
        {
          file: "word_resume_doc2.doc",
          full_name: "JOHN SMITH",
          email: "john.smith@smith.com"
        }
      end
    end
  end

  describe "pdf_resumes" do
    it_behaves_like "a parsed resume" do
      let(:resume) do
        {
          file: "pdf_resume.pdf",
          full_name: "SARA R. SMITH",
          email: "xxxxx@wm.edu"
        }
      end
    end

    it_behaves_like "a parsed resume" do
      let(:resume) do
        {
          file: "pdf_resume2.pdf",
          full_name: "John W. Smith",
          email: "jwsmith@colostate.edu"
        }
      end
    end
  end

end
