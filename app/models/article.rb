class Article < ApplicationRecord
  belongs_to :newspaper

  validates :headline, presence: true
  validates :url, presence: true, uniqueness: true 
end
