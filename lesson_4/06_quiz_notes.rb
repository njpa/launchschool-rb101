def star_method(stars)
  arr = []
  counter = 0

  until counter == stars.size do
    arr << stars[counter].upcase

    counter += 1
  end
  arr
end

stars_1 = ['Sirius', 'Rigel', 'Vega', 'Polaris', 'Altair']
stars_2 = star_method(stars_1)

stars_1.each { |x| puts x.object_id }
puts '----'
stars_2.each { |x| puts x.object_id }
