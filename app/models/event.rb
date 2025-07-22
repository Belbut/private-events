class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true

  belongs_to :creator, class_name: 'User'

  has_many :invitations
  has_many :attendees, through: :invitations

  def self.past
    Event.where('date <= ?', Date.current).order(:date)
  end

  def self.upcoming
    Event.where('date > ?', Date.current).order(:date)
  end
end
