class Beer < ActiveRecord::Base
  attr_accessible :abv, :description, :discontinued, :name, :style_id
  has_and_belongs_to_many :breweries
  belongs_to :style

  validates_presence_of :name

  def self.paginate(options = {})
    page(options[:page]).per(options[:per_page])
  end
end
