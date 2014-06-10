class Post < ActiveRecord::Base
  attr_accessible :body, :title

  has_many :comments
  
  validates_presence_of :body, :title

  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |post|
      csv << post.attributes.values_at(*column_names)
    end
  end
end
end
