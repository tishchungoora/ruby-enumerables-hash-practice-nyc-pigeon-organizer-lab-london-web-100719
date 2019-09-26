def nyc_pigeon_organizer(data)
  pigeon_list = {}
  
  # Work with male and female pigeons to first construct a hash backbone by merging the male and female hashes
  
  male_pigeons = data[:gender][:male]
  male_pigeon_list = {}
  
  female_pigeons = data[:gender][:female]
  female_pigeon_list = {}
  
  male_pigeons.each do |name|
    male_pigeon_list[name] = {:color => [], :gender => ["male"], :lives => []}
  end

  female_pigeons.each do |name|
   female_pigeon_list[name] = {:color => [], :gender => ["female"], :lives => []}
  end
  
  pigeon_list = male_pigeon_list.merge(female_pigeon_list)
  
  # Populate the applicable colors by visiting each pigeon key-value pair in the pigeon list. Find out if the pigeon name key is held as one of the values within any of the color key-value pairs. If so, convert the color key to a string and add it to pigeon list
  color_of_pigeon = data[:color]
  
  pigeon_list.each do |name, attribute_hash|
    color_of_pigeon.each do |color_sym, name_array|
      if name_array.include?(name)
        (pigeon_list[name][:color]).push(color_sym.to_s)
      end
    end
  end
  
  # Populate the applicable locations by visiting each pigeon key-value pair in the pigeon list. Find out if the pigeon name key is held as one of the values within any of the location key-value pairs. If so, add it to pigeon list
  residence_of_pigeon = data[:lives]
  
  pigeon_list.each do |name, attribute_hash|
    residence_of_pigeon.each do |location, name_array|
      if name_array.include?(name)
        (pigeon_list[name][:lives]).push(location)
      end
    end
  end
  pigeon_list
end

def nyc_pigeon_organizer(data) rhash = {} data.keys.map {|key| data[key].each {|item| item[1].map{|element| rhash[element] = {color: [], gender: [], lives: []} }}} data.keys.each {|key| data[key].each {|item| item[1].map {|name| rhash[name][key].push(item[0].to_s)}}} return rhash end h1 = nyc_pigeon_organizer(pigeon_data)