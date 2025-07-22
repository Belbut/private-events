class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true

  belongs_to :creator, class_name: 'User'

  has_many :invitations, dependent: :delete_all
  has_many :attendees, through: :invitations , dependent: :delete_all

  scope :past, -> { where('date <= ?', Date.current) }
  scope :upcoming, -> { where('date > ?', Date.current) }
end
