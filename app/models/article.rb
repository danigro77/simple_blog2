class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  attr_accessible :body, :title

  def self.ordered_by(param)
    case param
    when 'title'      then   self.order('title')
    when 'published'  then   self.order('created_at DESC')
    when 'word_count' then   self.order('length(body) desc')
    end
  end
end
