module ActsAsSeoFriendly
  module Datable
    def seo_friendly?
      false
    end

    def acts_as_seo_friendly(format_attribute: :title)
      class_eval do
        # Define association
        has_one :seo_datum, dependent: :destroy, class_name: 'ActsAsSeoFriendly::SeoDatum', as: :datable

        # Allow to create or update seo_datum as nested form
        accepts_nested_attributes_for :seo_datum, update_only: true, allow_destroy: true

        def self.seo_friendly?
          true
        end
      end

      # Include core methods for generating basic data, etc
      include Core
      include Getters

      self.seo_datable_with(format_attribute)
    end
  end
end
