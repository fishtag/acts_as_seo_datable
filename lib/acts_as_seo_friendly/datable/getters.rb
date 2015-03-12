module ActsAsSeoFriendly
  module Datable
    module Getters
      ActsAsSeoFriendly::Datable::Core::SEO_ATTRIBUTES.each do |seo_attr|
        define_method(seo_attr) do
          if seo_datum
            seo_datum.public_send(seo_attr)
          else
            public_send("dynamic_#{seo_attr}")
          end
        end
      end
    end
  end
end
