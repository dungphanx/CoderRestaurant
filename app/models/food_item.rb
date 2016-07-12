class FoodItem < ApplicationRecord
	validates :name, :section, :price, presence: true
	has_many :orders, dependent: :destroy

	def image_url
		if remote_image_url.present?
			remote_image_url
		else
			"http://loremflickr.com/320/240/#{CGI.escape name}"
		end
	end

	def self.by_section(section)
		where(section: section)
	end
end
