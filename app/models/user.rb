class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :events_created, class_name: 'Event', foreign_key: 'creator_id', dependent: :nullify

  # https://stackoverflow.com/questions/4632408/understanding-source-option-of-has-one-has-many-through-of-rails
  has_many :invitations, foreign_key: 'attendee_id', dependent: :delete_all
  has_many :events_invited, through: :invitations, source: :event, dependent: :delete_all
end
