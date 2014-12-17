class FederalState < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Associations
  #
  belongs_to :country, touch: true

  # Validations
  #
  validates :country,
            presence: true

  validates :name,
            presence: true


  def to_s
    name.to_s
  end

end
