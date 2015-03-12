require 'acts_as_seo_friendly/engine'

module ActsAsSeoFriendly
  extend ActiveSupport::Autoload

  autoload :Datable
  autoload_under 'datable' do
    autoload :Core
    autoload :Getters
  end
end

ActiveSupport.on_load(:active_record) do
  extend ActsAsSeoFriendly::Datable
end
