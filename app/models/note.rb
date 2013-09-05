class Note < ActiveRecord::Base
  attr_accessible :text
  belongs_to :user
  belongs_to :beer

  validates :user, presence: true
  validates :beer, presence: true
end
