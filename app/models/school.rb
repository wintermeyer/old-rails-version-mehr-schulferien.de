class School < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Associations
  #
  belongs_to :city, touch: true
  has_many :phone_numbers, as: :phone_numberable, dependent: :destroy

  # Validations
  #
  before_validation :downcase_email_address

  validates :name,
            presence: true

  validates :address_line1,
            presence: true

  validates :zip_code,
            presence: true,
            format: { with: /\A[0-9][0-9][0-9][0-9][0-9]\z/,
              message: "only allows xxxxx (5 digits) format" }

  validates :address_city_name,
            presence: true

  def to_s
    name.to_s
  end

  private
  def slug_candidates
    [
      [:zip_code, :name],
      [:zip_code, :name, :address_city_name]
    ]
  end

  def downcase_email_address
    if self.email_address.blank?
      self.email_address = nil
    else
      self.email_address = self.email_address.downcase.strip
    end
  end
end
