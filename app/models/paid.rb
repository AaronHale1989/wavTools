class Paid < ApplicationRecord
  belongs_to :user
  mount_uploader :audio, AudioUploader
  acts_as_votable
end
