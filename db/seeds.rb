# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Restaurant.delete_all
tag1 = Tag.create(title: 'Fast food')
tag2 = Tag.create(title: 'Burgers')
tag3 = Tag.create(title: 'Dessert')
tag4 = Tag.create(title: 'Pizza')
tag5 = Tag.create(title: 'Asia')
tag6 = Tag.create(title: 'Sushi')
r1 = Restaurant.create!(name: 'МакДональдз',
                        description:
      %(<p>
        МакДо́нальдз — американська корпорація, до 2010 найбільша у світі мережа закладів швидкого харчування.
        Входить в список «Fortune Global 500» 2009 року. У 2020 у рейтингу 10 кращих брендів.
      </p>),
                        image_url: 'mcdonalds.jpg',
                        address: 'вулиця Володимира Великого, 24А, Львів, Львівська область, 79000')

dish1 = Dish.create(name: 'Big Mac', price: 65, weight: 150, category: 'main_dish')
dish2 = Dish.create(name: 'Chiken Roll', price: 85, weight: 100, category: 'main_dish')
dish3 = Dish.create(name: 'Fish Roll', price: 85, weight: 105, category: 'main_dish')
dish4 = Dish.create(name: 'Double Roll', price: 135, weight: 140, category: 'main_dish')
dish5 = Dish.create(name: 'MacFlurry', price: 65, weight: 110, category: 'dessert')
dish6 = Dish.create(name: 'Ice Cream', price: 25, weight: 60, category: 'dessert')
r1.tags << tag1
r1.tags << tag2
r1.tags << tag3
r1.dishes << dish1
r1.dishes << dish2
r1.dishes << dish3
r1.dishes << dish4
r1.dishes << dish5
r1.dishes << dish6
r2 = Restaurant.create!(name: 'KFC',
                        description:
        %{<p>
        Kentucky Fried Chicken (KFC) — американська мережа ресторанів швидкого харчування,
        що спеціалізуються на стравах із курятини.
        Заснована в 1952 Гарландом Сандерсом під вивіскою Kentucky Fried Chicken.
        У 1991 бренд скоротив назву до абревіатури KFC.
        З 1997 мережа належить великій ресторанній компанії «Yum! Brands» що володіє такими брендами,
         як «Pizza Hut» і «Taco Bell».
          Нині мережа KFC представлена ​​в Україні та загалом 110 країнах світу — це більше 16 000 точок,
           в яких щодня обслуговуються близько 12 000 000 клієнтів.
          Головний офіс знаходиться в Луїсвіллі, штат Кентуккі.
        </p>},
                        image_url: 'kfc.png',
                        address: 'проспект Свободи, 19, Львів, Львівська область, 79000')

r2.tags << tag1
r2.tags << tag2
r2.tags << tag3
dish1 = Dish.create(name: 'Bucket duet spicy', price: 165, weight: 290, category: 'main_dish')
dish2 = Dish.create(name: '8 spicy wings', price: 125, weight: 120, category: 'main_dish')
dish3 = Dish.create(name: '5 strpis', price: 95, weight: 60, category: 'main_dish')
dish4 = Dish.create(name: 'Bucket fries', price: 120, weight: 240, category: 'main_dish')
dish5 = Dish.create(name: 'Donta strawberry', price: 55, weight: 40, category: 'dessert')

r2.dishes << dish1
r2.dishes << dish2
r2.dishes << dish3
r2.dishes << dish4
r2.dishes << dish5
r3 = Restaurant.create!(name: 'La Piec',
                        description:
        %(<p>
        La Piec — американська корпорація, до 2010 найбільша у світі мережа закладів швидкого харчування.
        За підсумками 2010 компанія займає друге місце за кількістю ресторанів
        у всьому світі після ресторанної мережі «Subway».
        Входить в список «Fortune Global 500» 2009 року. У 2020 у рейтингу 10 кращих брендів.
        </p>),
                        image_url: 'la.png',
                        address: 'проспект Свободи, 19, Львів, Львівська область, 79000')

r3.tags << tag1
r3.tags << tag4
dish1 = Dish.create(name: 'La Piec Pizza', price: 230, weight: 480, category: 'pizza')
dish2 = Dish.create(name: 'Quattro Formaggi', price: 241, weight: 450, category: 'pizza')
dish3 = Dish.create(name: 'Capricciosa', price: 208, weight: 430, category: 'pizza')
dish4 = Dish.create(name: 'Pepperoni', price: 209, weight: 445, category: 'pizza')
dish5 = Dish.create(name: 'Cheese pancakes', price: 87, weight: 90, category: 'dessert')

r3.dishes << dish1
r3.dishes << dish2
r3.dishes << dish3
r3.dishes << dish4
r3.dishes << dish5
r4 = Restaurant.create!(name: 'NOA',
                        description:
            %(<p>
            NOA — американська корпорація, до 2010 найбільша у світі мережа закладів швидкого харчування.
            За підсумками 2010 компанія займає друге місце за кількістю ресторанів
             у всьому світі після ресторанної мережі «Subway».
            Входить в список «Fortune Global 500» 2009 року. У 2020 у рейтингу 10 кращих брендів.
            </p>),
                        image_url: 'noa_black.svg',
                        address: 'проспект Свободи, 19, Львів, Львівська область, 79000')

r4.tags << tag5
r4.tags << tag6
dish1 = Dish.create(name: 'Spicy tuna salad', price: 249, weight: 130, category: 'main_dish')
dish2 = Dish.create(name: 'Ramen with smoked chicken', price: 164, weight: 400, category: 'soup')
dish3 = Dish.create(name: 'Vega Rakasey Ramen', price: 214, weight: 450, category: 'soup')
dish4 = Dish.create(name: 'Udon with chicken and cashew', price: 169, weight: 170, category: 'main_dish')

r4.dishes << dish1
r4.dishes << dish2
r4.dishes << dish3
r4.dishes << dish4
