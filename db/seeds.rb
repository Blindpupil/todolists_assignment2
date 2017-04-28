# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.create! [
    { username: 'Fiorina', password_digest: 'fasg31asd' },
    { username: 'Trump', password_digest: 'imadick' },
    { username: 'Carson', password_digest: 'imanotherdick' },
    { username: 'Clinton', password_digest: 'ifditupbad' }
             ]

Profile.create! [
    { gender: 'female', birth_year: '1954',
      first_name: 'Carly', last_name: 'Fiorina' },
    { gender: 'male', birth_year: '1946',
      first_name: 'Donald', last_name: 'Trump' },
    { gender: 'male', birth_year: '1951',
      first_name: 'Ben', last_name: 'Carson' },
    { gender: 'female', birth_year: '1947',
      first_name: 'Hillary', last_name: 'Clinton' }
                ]

def in_a_year
  Date.today + 1.year
end

TodoList.create! [
    { list_name: 'fio todos', list_due_date: in_a_year },
    { list_name: 'steps for armageddon', list_due_date: in_a_year },
    { list_name: 'carson todos', list_due_date: in_a_year },
    { list_name: 'how not to get elected', list_due_date: in_a_year }
                 ]

start = 0
user_length = User.all.length

while start < user_length do
  User.all[start].profile = Profile.all[start]
  User.all[start].todo_lists << TodoList.all[start]
  start += 1
end

TodoItem.create! [
    { due_date: in_a_year, title: 'First',
      description: 'Do thing 1', completed: true },
    { due_date: in_a_year, title: 'Second',
      description: 'Do thing 2', completed: true },
    { due_date: in_a_year, title: 'Third',
      description: 'Do thing 3', completed: true },
    { due_date: in_a_year, title: 'Fourth',
      description: 'Do thing 4', completed: true },
    { due_date: in_a_year, title: 'Fifth',
      description: 'Do thing 5', completed: true },
    { due_date: in_a_year, title: 'First',
      description: 'Ignore all science, evidence and facts', completed: true },
    { due_date: in_a_year, title: 'Second',
      description: 'Repeal the ACA', completed: false },
    { due_date: in_a_year, title: 'Third',
      description: 'Damage relations with Russia', completed: true },
    { due_date: in_a_year, title: 'Fourth',
      description: 'Bomb Afghanistan and threaten China', completed: true },
    { due_date: in_a_year, title: 'Fifth',
      description: 'Start war with North Korea', completed: false },
    { due_date: in_a_year, title: 'First',
      description: 'Do thing 1', completed: true },
    { due_date: in_a_year, title: 'Second',
      description: 'Do thing 2', completed: true },
    { due_date: in_a_year, title: 'Third',
      description: 'Do thing 3', completed: true },
    { due_date: in_a_year, title: 'Fourth',
      description: 'Do thing 4', completed: true },
    { due_date: in_a_year, title: 'Fifth',
      description: 'Do thing 5', completed: true },
    { due_date: in_a_year, title: 'First',
      description: 'Do thing 1', completed: true },
    { due_date: in_a_year, title: 'Second',
      description: 'Do thing 2', completed: true },
    { due_date: in_a_year, title: 'Third',
      description: 'Do thing 3', completed: true },
    { due_date: in_a_year, title: 'Fourth',
      description: 'Do thing 4', completed: true },
    { due_date: in_a_year, title: 'Fifth',
      description: 'Do thing 5', completed: true }
                 ]
count_list = 0
list_length = TodoList.all.length

while count_list < list_length do
  5.times do |i|
    i += count_list * 5
    TodoList.all[count_list].todo_items << TodoItem.all[i]
  end
  count_list += 1
end