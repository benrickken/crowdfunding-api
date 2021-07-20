class ProjectUploadForm
  include ActiveModel::Model

  attr_accessor :csv_file

  validates :csv_file, presence: true
  validate :validate_file_type

  def validate_file_type
    errors.add(:csv_file, 'のファイル形式が正しくありません') unless csv_file && csv_file.content_type == 'text/csv'
  end

  def save
    return false if invalid?

    error_messages = Project.import_projects_from_csv(csv_file)
    error_messages.each do |message|
      errors.add(:csv_file, message)
    end

    errors.empty?
  end
end
