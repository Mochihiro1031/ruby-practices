#!/usr/bin/env ruby

number = 0
while number < 20
    number += 1
    case
    when number % 3 == 0 && number % 5 != 0
        puts "Fizz"
    when number % 3 != 0 && number % 5 == 0
        puts "Buzz"
    when number % 3 == 0 && number % 5 == 0
        puts "FizzBuzz"
    else
        puts number
    end
end