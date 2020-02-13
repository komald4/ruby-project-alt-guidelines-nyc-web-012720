class Guest < ActiveRecord::Base
    has_many :guest_menu
    has_many :menu, through: :guest_menu
end