class Image < ActiveRecord::Base
  attr_accessible :content, :canvas_content
  attr_accessor :canvas_content
  has_attached_file :content,
                    :storage => :s3,
                    :s3_credentials => { access_key_id: ENV['s3_access_key_id'], secret_access_key: ENV['s3_secret_access_key']},
                    :path => "/:style/:id/:filename"
  belongs_to :imageable, polymorphic: true

  before_save :set_content_from_canvas_if_present

  def set_content_from_canvas_if_present
    if canvas_content.present?
      StringIO.open(Base64.decode64(self.canvas_content)) do |data|
        data.class_eval do
          attr_accessor :content_type, :original_filename
        end
        data.original_filename = "original.png"
        data.content_type = "image/png"
        self.content = data
      end
    end
  end
end
