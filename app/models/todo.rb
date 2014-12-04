class Todo < ActiveRecord::Base
  validates_presence_of :title, :completed_at
end
