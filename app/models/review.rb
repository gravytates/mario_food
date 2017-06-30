class Review < ApplicationRecord
  validates :author, :content_body, :rating, presence: true
  validates :content_body, length: { in: 10..250 }
  validates :rating, numericality: { greater_than: 0, less_than: 6 }
  before_save(:titlecase)

  belongs_to :product

private
  def titlecase
    new_author = self.author.split(' ')
      .each{|word| word.capitalize! }
      .join(' ')
    self.author = new_author
  end
end
