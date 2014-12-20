class Holiday < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Associations
  #

  # Validations
  #
  validates :name,
            presence: true,
            uniqueness: true

  def to_s
    name.to_s
  end

end
