class Country < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Associations
  #
  has_many :federal_states, dependent: :destroy

  # Validations
  #
  validates :name,
            presence: true

  validates :url_prefix,
            presence: true,
            uniqueness: true,
            length: { in: 1..3 },
            format: { with: /\A[a-z]+\z/,
              message: "only allows lowercase letters" }


  def to_s
    name.to_s
  end

end
