class Period < ActiveRecord::Base
  # Associations
  #
  belongs_to :holiday, touch: true
  belongs_to :periodable, polymorphic: true, touch: true

  # Validations
  #
  validates :first_day,
            presence: true

  validates :last_day,
            presence: true

  validates :holiday,
            presence: true

  validates :periodable,
            presence: true

  validate :dates_make_sense

  # TODO Validate the uniqueness of last_day and first_day

  def to_s
    "#{first_day} - #{last_day}"
  end

  private
  def dates_make_sense
    if !(last_day.blank? || first_day.blank?) &&
       last_day < first_day
      errors.add(:first_day, 'has to be before or at the last day')
    end
  end
end
