class Array
    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
  
        self
    end
  
    def my_select(&prc)
      selects = []
      
        self.my_each do |item|
          selects << item if prc.call(item)
        end
  
        selects
    end




    # a = [1, 2, 3]
    # a.my_select { |num| num > 1 } # => [2, 3]
    # a.my_select { |num| num == 4 } # => []

    # return_value = [1, 2, 3].my_each do |num|
    #    puts num
    #end.my_each do |num|
    #    puts num

   
    # p return_value

    def my_reject(&prc)
        selects = []
        
        self.my_each do |item|
            selects << item unless prc.call(item)
        end

        selects
    end

    # p a = [1, 2, 3]
    # p a.my_reject { |num| num > 1 } # => [1]
    # p a.my_reject { |num| num == 4 } # => [1, 2, 3]


    def my_any?(&prc)
        self.my_each do |item|
            return true unless prc.call(item)
        end

        false

    end

    def my_all?(&prc)
        self.my_each do |item|
            return false unless prc.call(item)
        end

        false
    end


    # p a = [1, 2, 3]
    # p a.my_any? { |num| num > 1 } # => true
    # p a.my_any? { |num| num == 4 } # => false
    # p a.my_all? { |num| num > 1 } # => false
    # p a.my_all? { |num| num < 4 } # => true


    def my_flatten

        flattened = []

        self.my_each do |el|
            if el.is_a?(Array)
                flattened.concat(el.my_flatten)
            else
                flattened << el
            end

        end

        flattened
    end

    # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


    def my_zip(*arrays)
        zipped = []
        self.length.times do |i|
            subzip = [self[i]]

            arrays.my_each do |array|
                subzip << array[i]
            end

            zipped << subzip
        end

        zipped
    end

    # p a = [ 4, 5, 6 ]
    # p b = [ 7, 8, 9 ]
    # p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    # p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
    # p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

    # p c = [10, 11, 12]
    # p d = [13, 14, 15]
    # p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


    def my_rotate(position = 1)
        split_idx = position % self.length
        
        self.drop(split_idx) + self.take(split_idx)
    end

    # p a = [ "a", "b", "c", "d" ]
    # p a.my_rotate         #=> ["b", "c", "d", "a"]
    # p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
    # p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
    # p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


    def my_join(separador = "")
        join = ""

        self.length.times do |i|
            join += self[i]
            join += separador unless i == self.length - 1
        end

        join
    end

    # p a = [ "a", "b", "c", "d" ]
    # p a.my_join         # => "abcd"
    # p a.my_join("$")    # => "a$b$c$d"


    def my_reverse
        reversed = []

        self.my_each do |el|
            reversed.unshift(el)
        end

        reversed
    end

    # [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
    # [ 1 ].my_reverse               #=> [1]



end








