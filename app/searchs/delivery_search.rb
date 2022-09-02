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
      truck_name = Truck.where('name LIKE ?', "%#{entry_name}%" )
      query.where(truck_id: truck_name)
    end

    def search_truck_driver_id
      truck_driver_id = TruckDriver.where(id: options[:truck_driver_id])
      driver_driven_truck = Truck.where(truck_driver_id: truck_driver_id)
      query.where(truck_id: driver_driven_truck)
    end

    def search_truck_driver_name
      entry_name = options[:truck_driver_name]
      truck_driver_name = TruckDriver.where('name LIKE ?', "%#{entry_name}%")
      driver_driven_truck = Truck.where(truck_driver_id: truck_driver_name)
      query.where(truck_id: driver_driven_truck)
    end
    
end
