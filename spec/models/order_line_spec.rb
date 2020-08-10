require 'rails_helper'

RSpec.describe OrderLine, type: :model do



	before(:each) do
		# =>         oid     cid     country   date                   qty   price
    order_line('1234', '5678', 'France', '2020-12-25 00:00:00', '10', '20.30')
    order_line('1234', '5678', 'France', '2020-12-25 00:01:00', '10',  '9.70')
    order_line('4321', '8765', 'EIRE',   '2021-03-21 12:00:00',  '5', '20.00')
	end

	subject(:order_lines) { OrderLine.all }

  describe 'without any order_lines' do
  	it 'should have null revenue' do
  		OrderLine.destroy_all
    	expect(order_lines.total_revenue).to eq(0)
    end

  end

  describe 'with multiple order_lines for the same order' do
    
  	it 'should have total revenue equal 400' do
  		expect(order_lines.total_revenue).to eq(400)
  	end

  	it 'should have average revenue per order equal 200' do
  		expect(order_lines.average_revenue_per_order).to eq(200)
  	end

  	it 'should have distinct customers equal 2' do
  		expect(order_lines.distinct_customers).to eq(2)
  	end

  end


  describe 'filtering for a specific country' do
  	let(:order_lines) { OrderLine.filter_by_country(country) }
    let(:country) { 'France' }

    it 'should have total revenue equal 400' do
  		expect(order_lines.total_revenue).to eq(300)
  	end

  	it 'should have average revenue per order equal 200' do
  		expect(order_lines.average_revenue_per_order).to eq(300)
  	end

  	it 'should have distinct customers equal 2' do
  		expect(order_lines.distinct_customers).to eq(1)
  	end
    
  end

  def order_line(oid, cid, country, date, qty, price)
		OrderLine.create(order_id: oid, customer_id: cid, country: country, date: date, quantity: qty, unit_price: price)
	end



end
