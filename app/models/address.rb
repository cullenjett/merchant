class Address < ActiveRecord::Base
  belongs_to :user
  has_many :orders

  validates_presence_of :line1, :city, :state, :zip
  validates :state, length: { is: 2 }
  validates :zip, length: { is: 5 }
  validates_format_of :zip, :with => /\d{5}/, :message => "Should be in the form 12345 or 12345-1234"
  validates :line1, uniqueness: { scope: :user }

  def to_s
    [line1, line2, city, state, zip].compact.join(", ")
  end
end
