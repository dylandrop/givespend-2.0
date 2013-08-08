module ItemsHelper
	def color_class
		["red-card", "teal-card", ""].sample
	end

  def acronymize some_title
    (/^[A-Z]+$/.match(some_title) || some_title.length < 11) ? some_title : some_title.gsub(/(\w)\w+\W*/, '\1').upcase
  end

  def image_tag_with_fallback image
    image_tag (image.present? ? image.content.url : 'fancybox_overlay.png')
  end
end
