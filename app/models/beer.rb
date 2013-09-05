class Beer < ActiveRecord::Base
  attr_accessible :abv, :description, :discontinued, :name, :style_id, :style
  has_and_belongs_to_many :breweries
  belongs_to :style
  has_many :notes, dependent: :destroy

  validates_presence_of :name

  def self.paginate(options = {})
    page(options[:page]).per(options[:per_page])
  end
end
