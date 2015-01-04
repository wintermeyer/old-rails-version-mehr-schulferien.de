class PhoneNumber < ActiveRecord::Base
  # Associations
  #
  belongs_to :phone_numberable, polymorphic: true, touch: true

  # Callbacks
  #
  before_validation :format_value

  # Validations
  #
  validates :name,
            presence: true

  validates :value,
            presence: true,
            uniqueness: { scope: [:name, :phone_numberable],
              message: "should be unique per instance" },
            format: { with: /\A\+49\-[1-9][0-9]+\-[0-9][0-9][0-9]+\z/,
              message: "only allows +49-xxx-xxxxx format" }

  validates :phone_numberable,
            presence: true

  def to_s
    "#{value} (#{name})"
  end

  private
  def format_value
    # This only works for German phone numbers.
    # There is room for improvement.
    #
    case self.value.to_s.strip
    when /\A\(0([1-9][0-9]+)\)([0-9]+)\z/
      self.value = "+49-#{$1}-#{$2}"
    when /\A0([1-9][0-9]+)[-\/ ]([0-9]+)\z/
      self.value = "+49-#{$1}-#{$2}"
    end
  end

end
