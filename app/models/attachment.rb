class Attachment < ActiveRecord::Base
  mount_uploader :file_attachment, AttachmentUploader

  before_validation :fill_in_attributes

  self.inheritance_column = nil

  belongs_to :project
  belongs_to :user

  private

  def fill_in_attributes
    self.name = file_attachment.file.original_filename
    extension = ATTACHMENT_TYPES.find {|k,v| v.include? file_attachment.file.extension}
    self.type = extension.blank? ? "document" : extension[0]
  end

end
