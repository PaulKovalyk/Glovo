# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Restaurant.delete_all
r1 = Restaurant.create!(name: 'МакДональдз',
                        description:
      %(<p>
        МакДо́нальдз — американська корпорація, до 2010 найбільша у світі мережа закладів швидкого харчування.
        За підсумками 2010 компанія займає друге місце за кількістю ресторанів у всьому світі після ресторанної мережі «Subway».
        Входить в список «Fortune Global 500» 2009 року. У 2020 у рейтингу 10 кращих брендів.
      </p>),
                        image_url: 'mcdonalds.jpg',
                        address: 'вулиця Володимира Великого, 24А, Львів, Львівська область, 79000')
tag1 = Tag.create(title: 'Fast food')
tag2 = Tag.create(title: 'Burgers')
tag6 = Tag.create(title: 'Dessert')
r1.tags << tag1
r1.tags << tag2
r1.tags << tag6
r2 = Restaurant.create!(name: 'KFC',
                        description:
        %{<p>
        Kentucky Fried Chicken (KFC) — американська мережа ресторанів швидкого харчування, що спеціалізуються на стравах із курятини.
         Заснована в 1952 Гарландом Сандерсом під вивіскою Kentucky Fried Chicken. У 1991 бренд скоротив назву до абревіатури KFC.
         З 1997 мережа належить великій ресторанній компанії «Yum! Brands» що володіє такими брендами, як «Pizza Hut» і «Taco Bell». Нині мережа KFC представлена ​​в Україні та загалом 110 країнах світу — це більше 16 000 точок, в яких щодня обслуговуються близько 12 000 000 клієнтів. Головний офіс знаходиться в Луїсвіллі, штат Кентуккі.
        </p>},
                        image_url: 'kfc.png',
                        address: 'проспект Свободи, 19, Львів, Львівська область, 79000')
tag3 = Tag.create(title: 'Fast food')
tag4 = Tag.create(title: 'Burgers')
r2.tags << tag3
r2.tags << tag4
r3 = Restaurant.create!(name: 'La Piec',
                        description:
        %(<p>
        La Piec — американська корпорація, до 2010 найбільша у світі мережа закладів швидкого харчування.
        За підсумками 2010 компанія займає друге місце за кількістю ресторанів у всьому світі після ресторанної мережі «Subway».
        Входить в список «Fortune Global 500» 2009 року. У 2020 у рейтингу 10 кращих брендів.
        </p>),
                        image_url: 'la.png',
                        address: 'проспект Свободи, 19, Львів, Львівська область, 79000')
tag5 = Tag.create(title: 'Pizza')
tag6 = Tag.create(title: 'Burgers')
r3.tags << tag5
r3.tags << tag6
r4 = Restaurant.create!(name: 'NOA',
                        description:
            %(<p>
            NOA — американська корпорація, до 2010 найбільша у світі мережа закладів швидкого харчування.
            За підсумками 2010 компанія займає друге місце за кількістю ресторанів у всьому світі після ресторанної мережі «Subway».
            Входить в список «Fortune Global 500» 2009 року. У 2020 у рейтингу 10 кращих брендів.
            </p>),
                        image_url: 'noa_black.svg',
                        address: 'проспект Свободи, 19, Львів, Львівська область, 79000')
tag5 = Tag.create(title: 'Asia')
tag6 = Tag.create(title: 'Sushi')
r4.tags << tag5
r4.tags << tag6
