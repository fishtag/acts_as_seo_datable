module ActsAsSeoFriendly
  module Datable
    module Core
      extend ActiveSupport::Concern

      SEO_ATTRIBUTES = %i(meta_title meta_keywords meta_description)

      included do
        class_attribute :meta_keywords_format
        class_attribute :meta_description_format
        class_attribute :meta_title_format
        class_attribute :format_attribute

        # Set default interpolation strings
        format_meta_description_as '%s'
        format_meta_keywords_as '%s'
        format_meta_title_as '%s'
      end

      module ClassMethods
        # Define class-level methods for setting seo attributes
        SEO_ATTRIBUTES.each do |seo_attr|
          define_method(%[format_#{seo_attr}_as]) do |seo_attribute_format = nil, &block|
            seo_attribute_format = block.call if block

            seo_attribute_format.squish! if seo_attribute_format.is_a?(String)

            send(%[#{seo_attr}_format=], seo_attribute_format)
          end
        end

        # Define method for setting default format argument
        def seo_datable_with(format_attribute)
          self.format_attribute = format_attribute.to_sym
        end
      end

      # Defines instance methods for setting basic seo datum attributes
      ActsAsSeoFriendly::Datable::Core::SEO_ATTRIBUTES.each do |seo_attr|
        define_method(%(#{seo_attr}_format_attributes)) do
          try(%(format_#{seo_attr}_with)) || send(self.class.format_attribute)
        end

        define_method(%[dynamic_#{seo_attr}]) do
          self.class.send(%[#{seo_attr}_format]) % send(%(#{seo_attr}_format_attributes))
        end
      end
    end
  end
end
