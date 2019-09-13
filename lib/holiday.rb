require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]

  # another solution
  # holiday_hash.each do |season, day_hash|
  #   if season == :summer
  #     day_hash.each do |holiday, attributes|
  #       if holiday == :fourth_of_july
  #         return attributes[1]
  #       end
  #     end
  #   end
  # end
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash[:winter].each do |holiday_key, supplies_value|
    supplies_value << supply
  end

  # holiday_hash.each do |season, holiday|
  #   holiday.each do |day, supplies|
  #     if day == "christmas" || day == "new_years"
  #       supplies << supply
  #     end
  #   end
  # end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array

  holiday_hash[:spring].each do |holiday, supplies|
    supplies << supply
  end

  # holiday_hash[:spring][:memorial_day] << supply
  #   holiday_hash

  # holiday_hash.each do |season, holiday|
  #   holiday.each do |day, supplies|
  #     if day == :memorial_day
  #       supplies << supply
  #     end
  #   end
  # end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []

  holiday_hash[:winter].each do |day, supplies|
    winter_supplies << supplies
  end

  winter_supplies.flatten

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    puts "#{season.capitalize}:"
    # puts season.to_s.capitalize + ":"
      holiday.each do |day, supplies|
        holiday_name = day.to_s.split("_").collect do |holiday_name|
          holiday_name.capitalize
        end
      puts "  #{holiday_name.join(" ")}: #{supplies.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq = []
  holiday_hash.each do |season, holiday|
    holiday.each do |day, supplies|
      bbq << day if supplies.include?('BBQ')
    end
  end
  bbq
end
