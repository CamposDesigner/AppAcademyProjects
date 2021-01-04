class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs 

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map { |char| char.upcase }
    else
      raise "Pegs are invalid"
    end
  end

  #def initialize(pegs)
  #  reise if !Code.valid_pegs?(pegs)
  #  @pegs = pegs.map(&:upcase)
  #end

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  #def self.valid_pegs?(chars)
  #  chars.all? { |char| Code::POSSIBLE_PEGS.include?(char.upcase) }
  #end

  def self.random(length)
    random_pegs = []
    length.times {random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end

  
  #def self.random(length)
  #  pegs = Array.new(length) { Code::POSSIBLE_PEGS.keys.sample }
  #  Code.new(pegs)
  #end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end
  
  def num_exact_matches(guess_code)
    count = 0

    (0...guess_code.length).each do |i|
      count += 1 if guess_code[i] == self[i]
    end
    count
  end

  def num_near_matches(guess_code)
    count = 0

    (0...guess_code.length).each do |i|
      if guess_code[i] !=self[i] && self.pegs.include?(guess_code[i])
        count += 1
      end
    end

    count
  end

    
  #def num_exact_matches(guess_code)
  #  (0...guess_code.length).count { |i| guess_code[i] == @pegs[i] }
  #end
  
  #def num_near_matches(guess_code)
  #  num_matches = (0...guess_code.length).count do |i|
  #    guess_peg = guess_code[i]
  #    pegs.include?(guess_peg)
  #  end

  #  num_matches - self.num_exact_matches(guess_code)
  #end

  def ==(other_code)
    self.length == other_code.length && self.num_exact_matches(other_code) == self.length
  end

end
