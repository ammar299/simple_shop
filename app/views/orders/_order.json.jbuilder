json.extract! order, :id, :customer_name, :shipping_address, :summary, :created_at, :updated_at
json.url order_url(order, format: :json)
