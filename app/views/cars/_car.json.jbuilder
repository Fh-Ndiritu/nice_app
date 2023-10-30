json.extract! car, :id, :car_model, :brand, :power, :color, :seat_capacity, :description, :price, :location, :created_at, :updated_at
json.url car_url(car, format: :json)
