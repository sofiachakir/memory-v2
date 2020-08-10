module OrderLinesHelper
	def selected_country
		params[:country]
	end

	def countries
		OrderLine.distinct.pluck(:country)
	end

	def show_revenue(order_lines)
		revenue = order_lines.total_revenue
		thousands = (revenue / (10 ** 3)).round(1)
		billions =  (revenue / (10 ** 6)).round(1)

		billions.truncate(1) == 0 ? "#{thousands} K€" : "#{billions} M€"
	end

	def show_average_revenue(order_lines)
		"#{order_lines.average_revenue_per_order.round(1)} €"
	end
end
