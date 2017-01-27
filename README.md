# README
[![Code Climate](https://codeclimate.com/github/tboucheau/Meal_plan/badges/gpa.svg)](https://codeclimate.com/github/tboucheau/Meal_plan)

Basé sur https://coderjourney.com/blog/ sur la création d'une application Rails permettant de créer des menus planifiés sur une semaine, cette application est `dockerisée`.

* Rails v2.3.1.

* docker compose v2.

* L'application se lance avec `docker-compose up`/

* La base de données se crée avec `docker-compose exec app rails db:create db:migrate`.

* Il est possible de prépeupler la base de données avec `docker-compose exec app rails db:seed` mais ce n'est pas obligé.

* Les tests se font avec `docker-compose exec app rails db:test:prepare` puis `docker-compose exec app rails test`.

* le login par défaut si vous avez fait un `seed` est test@example.com / password.

* Le site est accessible [ici](ror.appcaze.fr/Meal_plan)
