class FederalState < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Associations
  #
  belongs_to :country, touch: true
  has_many :periods, as: :periodable, dependent: :destroy
  has_many :cities, dependent: :destroy
  has_many :schools, through: :cities

  # Validations
  #
  validates :country,
            presence: true

  validates :name,
            presence: true,
            uniqueness: { scope: :country,
                          message: "should be unique per country" }


  def to_s
    name.to_s
  end

end
