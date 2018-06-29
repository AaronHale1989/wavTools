class Sample < ApplicationRecord
  mount_uploader :audio, AudioUploader
  belongs_to :user
  acts_as_votable
end
