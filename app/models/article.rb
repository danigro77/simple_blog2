class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  attr_accessible :body, :title

  def self.ordered_by(param)
    case param
    when 'title'      then   Article.order('title')
    when 'published'  then   Article.order('created_at DESC')
    when 'word_count' then   Article.order('length(body) desc')
    else                     Article.all
    end
  end

end
