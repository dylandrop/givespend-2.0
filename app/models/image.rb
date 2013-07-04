class Image < ActiveRecord::Base
  attr_accessible :content
  attr_accessor :canvas_content
  has_attached_file :content,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "/:style/:id/:filename"
  belongs_to :imageable, polymorphic: true

  before_save :set_content_from_canvas_if_present

  def set_content_from_canvas_if_present
    content = canvas_content if canvas_content.present?
  end
end
