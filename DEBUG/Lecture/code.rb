require "byebug"

def avg(a, b)
    sum = a + b
    sum / 2.0
end

debugger
first_result = avg(15, 20)
second_result = first_result + 0.5

p second_result

