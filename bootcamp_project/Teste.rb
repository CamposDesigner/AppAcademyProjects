

def prime?(num)
    (2...num).each do |idx|
        if num % idx == 0
            return false
        end
    end
    true
end
end




[5] pry(main)> load 'primes.rb'
=> true
[6] pry(main)> prime?(2)
=> true
[7] pry(main)> prime?(3)
=> true
[8] pry(main)> prime?(10)
=> false
[9] pry(main)> prime?(17)
=> true 


p prime