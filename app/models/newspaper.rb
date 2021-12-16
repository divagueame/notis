class Newspaper < ApplicationRecord
  has_many :articles
 
  validates :newspaperName, presence: true, uniqueness: true
  validates :newspaperUrl, presence: true, uniqueness: true
  validates :newspaperCssSelector, presence: true
  validates :newspaperArticleUrlAppend, presence: true
end
