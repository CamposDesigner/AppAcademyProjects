#Problem 1: 

def sum_recur(array)
    sum = 0
    array.each do |number|
        sum += number
    end
    sum
end

#puts sum_recur([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])



#Problem 2: 

def includes?(array, target)
    array.each do |k, v|
        if k == key
            return true
        elsif v.class.to_s == "Array"
            v.each do |inner_array|
                return has_key(inner_array, key)
            end
        else
            return false
        end
    end

end


# Problem 3: 

def num_occur(array, target)
    return false if array.empty?
    return true if array.first == target 
    includes?(array.drop(1), target)
end

# Problem 4: 

def add_to_twelve?(array)
    dup_array = array.dup
    return false id dup_array.count - 1 == 0
    return true id dup_array.pop + dup_array.last == 12
    add_to_twelve?(dup_array)
end

# Problem 5: 

def sorted?(array)
    return [] if array.empty?
    dup_array = array.dup
    return true if dup_array.count - 1 == 0
    return false if dup_array.pop < dup_array.last
    sorted?(dup_array)

end

# Problem 6: 

def reverse(string)
    return string if string.length <= 1
    string[-1] + reverse(string.slice(1, string.length - 2)) + string[0]
end
