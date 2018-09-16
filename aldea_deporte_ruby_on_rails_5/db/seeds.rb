# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
        user_name: 'AldeaAdmin',
        first_name: 'AldeaAdmin',
        last_name: 'AldeaAdmin',
        birthday: '2017-09-16 13:51:43',
        phone: '000000',
        document_type: 'Cedula de Ciudadania',
        document: '12345678',
        # document_file: nil,
        # photo: nil,
        email: 'AldeaAdmin@aldeadeporte.com',
        password: "Aldeadeporte2018", 
        password_confirmation: "Aldeadeporte2018"
)

p "Created #{User.count} user"

Role.create(
    [
        {name: 'Admin'},
        {name: 'Ciudadano'},
        {name: 'Lider Deportivo'},
    ]
)

p "Created #{Role.count} roles"

UsersRole.create(
    user_id: 1,
    role_id: 1
)

p "Created relation with role admin user AldeaAdmin"

SportCategory.create(
    [
        {description: 'Futbol'},
        {description: 'Micro Futbol'},
        {description: 'Baloncesto'},
        {description: 'Patinaje'},
        {description: 'Ciclismo'},
        {description: 'Actividades Recreativas'},
    ]
)

p "Created #{SportCategory.count} sport categories"