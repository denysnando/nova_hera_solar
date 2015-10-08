class Address < ActiveRecord::Base
  belongs_to :account

  def to_sentence
    [street, number, city, state].compact.join ", "
  end
end
