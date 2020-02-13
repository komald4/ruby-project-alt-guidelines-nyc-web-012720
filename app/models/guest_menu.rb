class Guest_Menu < ActiveRecord::Base
    belongs_to :menu
    belongs_to :guest
end