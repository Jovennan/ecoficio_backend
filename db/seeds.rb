# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
orgao = Orgao.create(nome: "Polícia Militar", endereco: "Praça Pedro Américo, Centro - João Pessoa")
departamento = Departamento.create(nome: "Estado Maior", orgao: Orgao.first)
user = User.create(email: 'coordenador@pm.pb.gov.br',nome: "Beltrano", cpf: "09876543210",
    cargo: "Chefe", password: '12345678', password_confirmation: '12345678',
    departamento: Departamento.first)
