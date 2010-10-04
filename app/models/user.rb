class User < ActiveRecord::Base
 named_scope :with_ids, lambda { |*ids| {
    :conditions => { :id => ids.flatten }
  }}
end
