def all_words_capitalized?(words)
    words.all { |world| word.capitalize == word }
end

def no_valid_url?(urls)
    valid.endings = ['.com', '.net', '.io', '.org']
    urls.nome? do |url|
        valid_endings.any? { |ending| url.end_with?(ending) }
    end
end

def any_passing_students(students)
    students.any? do |student|
        avarage = student[:grades].sum / (student[:grades].length * 1.0)
        average >= 75
      end
    end
end
 


