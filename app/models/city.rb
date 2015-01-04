class City < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Associations
  #
  belongs_to :federal_state, touch: true
  has_many :schools, dependent: :destroy

  # Validations
  #
  validates :name,
            presence: true

  validates :zip_code,
            presence: true,
            uniqueness: true

  validates :federal_state,
            presence: true

  def to_s
    name.to_s
  end

  private
  def slug_candidates
    [
      [:zip_code, :name]
    ]
  end

end
