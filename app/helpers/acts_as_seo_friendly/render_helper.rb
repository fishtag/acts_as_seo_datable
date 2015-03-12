module ActsAsSeoFriendly
  module RenderHelper
    def set_seo_meta_tags(seo_friendly_object)
      title seo_friendly_object.meta_title
      description seo_friendly_object.meta_description
      keywords seo_friendly_object.meta_keywords
    end
  end
end
