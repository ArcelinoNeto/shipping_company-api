namespace :dev do
  desc "Configurando ambiente de desenvolvimento e teste"
  task setup: :environment do
    puts "Zerando a base..."
    
    %x(rails db:drop db:create db:migrate)
    
    puts "Base zerada com sucesso!"
    puts " "

    puts "Cadastando motoristas..."

    5.times do |i|
      TruckDriver.create!(name: Faker::Name.unique.name)
    end

    puts "Motoristas cadastrados com sucesso!"
    puts " "

    puts "Cadastando caminhões..."
    
    5.times do |i|
      Truck.create!(
        name: Faker::Name.first_name,
        truck_driver: TruckDriver.all.sample
      )
    end

    puts "Caminhões cadastrados com sucesso!"
    puts " "

    puts "Cadastando produtos..."

    100.times do |i|
      Product.create!(
        kynd: Faker::Commerce.material,
        description: Faker::Commerce.product_name,
        value: Faker::Commerce.price(range: 0..10.0, as_string: true)
      )
    end
    puts "Produtos cadastrados com sucesso!"
    puts " "

    puts "Cadastando entregas..."

    100.times do |i|
      Delivery.create!(
        origin_city: Faker::Address.city,
        destiny_city: Faker::Address.city,
        truck: Truck.all.sample,
        product: Product.all.sample
      )
    end

    puts "Entregas cadastrados com sucesso!"
    puts " _____ "
    
  end

end
