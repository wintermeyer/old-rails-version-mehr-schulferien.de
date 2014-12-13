class FederalState < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Associations
  #
  belongs_to :country, touch: true

  # Validations
  #
  validates :name,
            presence: true,
            uniqueness: { scope: :country }

  def to_s
    name
  end
end
