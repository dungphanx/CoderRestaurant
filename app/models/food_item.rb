class FoodItem < ApplicationRecord
	validates :name, :section, :price, presence: true
	has_many :orders, dependent: :destroy
	has_many :comments, dependent: :destroy

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

	def average_rate
		#result = 0
		#no_cmt = comments.count
		#unless no_cmt == 0
		#	total_rate = comments.collect{|c| c.rate}.sum
		#	result = total_rate / no_cmt
		#end
		#result.round(3)
		value = comments.size == 0 ? 0 : (comments.sum(:rate) / comments.size).round(3)
	end
end
