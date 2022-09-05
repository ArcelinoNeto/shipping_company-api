class DeliverySearch < Searchlight::Search
    def base_query
      Delivery.all
    end
  
    def search_origin_city
      query.where('origin_city LIKE ?', "%#{origin_city}%")
    end

    def search_destiny_city
      query.where('destiny_city LIKE ?', "%#{destiny_city}%")
    end

    def search_created_at
      entry_date = options[:created_at]
      converted_date = entry_date.to_date
      Delivery.where('created_at >= ?', "%#{converted_date}%")
    end

    def search_created_final
      entry_date = options[:created_final]
      converted_date = entry_date.to_date
      Delivery.where('created_at <= ?', "%#{converted_date}%")
    end

    def search_truck_id
      query.where(truck_id: options[:truck_id])
    end

    def search_truck_name
      entry_name = options[:truck_name]
      query.joins(:truck).where('name LIKE ?', "%#{entry_name}%" )
    end

    def search_truck_driver_id
      truck_driver_id = options[:truck_driver_id]
      query.joins(truck: :truck_driver).where('trucks.truck_driver_id = ?', "#{truck_driver_id}" )
    end

    def search_truck_driver_name
      entry_name = options[:truck_driver_name]
      query.joins(truck: :truck_driver).where('truck_drivers.name LIKE ?', "%#{entry_name}%" )
    end

    def search_product_id
      query.where(product_id: options[:product_id])
    end

    def search_product_kind
      entry_kind = options[:product_kind]
      query.joins(:product).where('kind LIKE ?', "%#{entry_kind}%" )
    end

end
