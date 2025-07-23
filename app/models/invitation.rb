class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: 'User'

  # https://apidock.com/rails/ActiveRecord/Validations/ClassMethods/validates_uniqueness_of
  validates_uniqueness_of :event_id, scope: %i[attendee_id]
end
