module ResumeParser
  module CommonResumeSections
    JOB_HISTORY= %w[experience job\ history professional\ experience work]
    EDUCATION= %w[education]
    SKILLS = %w[skills]
    OTHERS = %w[projects]
    ALL = JOB_HISTORY + EDUCATION + SKILLS
  end
end
