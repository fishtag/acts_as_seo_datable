module ActsAsSeoFriendly
  module Datable
    def seo_friendly?
      false
    end

    def acts_as_seo_friendly(format_attribute: :title)
      class_eval do
        # Define association
        has_one :seo_datum,
                as: :datable,
                class_name: '::ActsAsSeoFriendly::SeoDatum',
                dependent: :destroy

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
