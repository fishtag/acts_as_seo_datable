module ActsAsSeoFriendly
  class SeoDatum < ::ActiveRecord::Base
    PERMITTED_ATTRIBUTES = %i(id meta_title meta_keywords meta_description _destroy)

    belongs_to :datable, polymorphic: true
  end
end
