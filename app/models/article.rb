class Article < ActiveRecord::Base
  belongs_to :category
  validates :title, :body, :category_id, presence: true
end
