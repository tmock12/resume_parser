require 'resume_parser/common_resume_sections'

module ResumeParser
  class JobHistoryExtractor

    attr_accessor :text

    def initialize(text)
      @text = text
    end

    def job_history
      job_history_section.split("\n\n")
    end

    def job_history_section
      @job_history_section ||=
        text[job_history_section_regexp].gsub(other_category_sections_regexp, "")
    end

    private

    def job_history_section_regexp
      /#{job_history_section_titles_regexp}.+/m
    end

    def other_category_sections_regexp
      /(#{other_sections_regexp}).+/m
    end

    def job_history_section_titles_regexp
      Regexp.new(Regexp.union(potential_job_history_titles).source, "i")
    end

    def other_sections_regexp
      Regexp.new(Regexp.union(CommonResumeSections::ALL - potential_job_history_titles).source, "i")
    end

    def potential_job_history_titles
      CommonResumeSections::JOB_HISTORY
    end

  end
end
