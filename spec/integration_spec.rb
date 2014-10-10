require 'spec_helper'

shared_examples "a parsed resume" do

  subject do
    ResumeParser.parse(File.read("spec/fixtures/#{resume[:file]}"))
  end

  it "returns parsed resume fields" do
    expect(subject.full_name).to eq(resume[:full_name])
    expect(subject.email_address).to eq(resume[:email])
    expect(subject.phone_numbers).to eq(resume[:phone_numbers])
  end

end

describe ResumeParser do

  describe "docx" do
    it_behaves_like "a parsed resume" do
      let(:resume) do
        {
          file: "word_resume.docx",
          full_name: "John J. Doe",
          email: "joe@bla.com",
          phone_numbers: { phone: "(847) 767-8821" }
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
          email: "j.smith@johnsmith.com",
          phone_numbers: { mobile: "(123) 555-5555", phone: "(123) 555-5555" }
        }
      end
    end

    it_behaves_like "a parsed resume" do
      let(:resume) do
        {
          file: "word_resume_doc2.doc",
          full_name: "JOHN SMITH",
          email: "john.smith@smith.com",
          phone_numbers: { phone: "(555) 555-5555" }
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
          email: "xxxxx@wm.edu",
          phone_numbers: { home: '555-555-0000', mobile: '555-555-0000', phone: '555-555-0000' }
        }
      end
    end

    it_behaves_like "a parsed resume" do
      let(:resume) do
        {
          file: "pdf_resume2.pdf",
          full_name: "John W. Smith",
          email: "jwsmith@colostate.edu",
          phone_numbers: {}
        }
      end
    end
  end

end
