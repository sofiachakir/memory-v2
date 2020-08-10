class OrderLine < ApplicationRecord
	scope :filter_by_country, -> (country) { where(country: country) }

	def self.total_revenue
		sum("unit_price * quantity")
	end

	def self.average_revenue_per_order
		orders_revenues = group(:order_id).sum('unit_price * quantity').values
		orders_revenues.empty? ? 0 : orders_revenues.sum / orders_revenues.length
	end

	def self.distinct_customers
		select(:customer_id).distinct.count
	end

	def self.revenue_per_month
		select("sum(unit_price*quantity) as revenue", "substring(date from 0 for 8) as month")
			.group(2).order(2).map{|l| [l.month, (l.revenue / 1000).round(1)] }
	end

end
