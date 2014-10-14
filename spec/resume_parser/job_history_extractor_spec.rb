require 'resume_parser/job_history_extractor'

describe ResumeParser::JobHistoryExtractor do
  let(:example_text) do
    "john smith\n1234 Main St  Anytown, State  123456 \nCELL (123) 555-5555  E-MAIL j.smith@johnsmith.com\n\n\nPROFILE\tLorem ipsum dolor sit amet, consectetur adipiscing elit.\n
    Nulla nec dui magna, ac dapibus nunc. \n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur mus. \nSuspendisse nulla nisi, eleifend sit amet tincidunt sit am
    et, malesuada at orci. \nPhasellus porta est ac tortor iaculis gravida porttitor eros viverra. \n\nEDUCATION\tBachelor of Arts \n\tImpressive University, Ivy League, NY 12345\n\t
    Graduated 2006\n\n\nSKILLS\tCertification 1\t\tFancy Software 1\tSoftware 2\nFancy Software 2\tFancy Software 4\tSoftware 5\n\n\nEXPERIENCE\tCompany 1 \nVivamus scelerisque enim
    vel ante sollicitudin fermentum. Praesent pulvinar  faucibus fringilla. Ut ultrices tellus a nisi ultrices vulputate. \n\nCompany 2 \nVivamus lacus lorem, euismod sed aliquet nec
    , aliquam eu tellus. Etiam volutpat sem a leo elementum euismod. Maecenas cursus, mauris vel posuere ultrices, mauris odio eleifend enim, ac venenatis augue mi quis purus.\n\nInternship \nVivamus scelerisque enim vel ante sollicitudin fermentum. Praesent pulvinar  faucibus fringilla. Ut ultrices tellus a nisi ultrices vulputate. \n\n\n1234 Main St  Anyto
    wn, State  123456  CELL (123) 555-5555  E-MAIL j.smith@johnsmith.com\n\n"
  end

  describe "#job_history_section" do
    let(:subject) { ResumeParser::JobHistoryExtractor.new(example_text) }
    it 'finds the job history/experience section' do
      expect(subject.job_history_section).to eq("bla")
    end
  end
end
