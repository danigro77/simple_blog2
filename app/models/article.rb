class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  attr_accessible :body, :title, :word_count

  def self.ordered_by(param)
    case param
    when 'title'      then   self.order('title')
    when 'published'  then   self.order('created_at DESC')
    when 'word_count' then   self.order('word_count DESC')
    end
  end
end
