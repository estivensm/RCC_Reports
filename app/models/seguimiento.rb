class Seguimiento < ApplicationRecord
  belongs_to :report
  mount_uploader :attachment, AttachmentUploader
end
