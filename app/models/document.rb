class Document < ActiveRecord::Base
  has_many :comments
  has_many :attachments

  def to_indexable
    {
        content: attachments.map {|a| a.pages.map(&:text)}.flatten.join(' ')
    }
  end
end
