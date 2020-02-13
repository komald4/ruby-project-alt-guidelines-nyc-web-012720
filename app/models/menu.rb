class Menu < ActiveRecord::Base
    has_many :guest_menu
    has_many :guests, through: :guest_menu
end
