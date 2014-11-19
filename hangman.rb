#!/usr/bin/env ruby
require 'pry'
puts "Welcome to Hangman!\n"

# Choose a word from word bank at random.
# Set chances to 8.
# If letter chosen is not in word, reduce chances by 1, else show letter.
# If word is guessed, you win, else you lose.

bank = ['something', 'goes', 'here']
word = bank.sample.downcase
hidden = ''
word.length.times do |l|
  l = '_'
  hidden << l
end

length = (word.length - 1)
i = 0
chances = 8

puts "Guess a letter, or the whole word. If you guess the whole word and are wrong, you lose."
guess = gets.chomp.downcase

while hidden != word && chances >= 0
  if guess == word || hidden == word
    break
    return "'#{word}' is correct! You win"
  elsif guess.length > 1 && guess != word
    return puts "You lose."
  else
    unchanged = hidden
    until i > length
      if word[i].include?(guess)
        hidden[i] = guess
      end
      i += 1
    end
    puts unchanged
    puts hidden
    if unchanged == hidden
      chances -= 1
    end
    i = 0
    print "You have #{chances} chances left: "
    guess = gets.chomp.downcase
  end
end

# word = word.downcase.split(//)
# show = []

# word.each do |l|
#   if l != nil
#     show << "_"
#   end
# end

# hash = Hash[word.zip(show)] # "w" => "_"...
# # guess = []
# i = 8

# while (i >= 0)
#   input = gets.downcase.chomp
#   hash.each do |k, v|
#     if input == k
#       hash[k] = (v = input)
#       print v
#       input = gets.downcase.chomp
#     else
#       puts "Sorry, that letter is not in the word. Please try again."
#       i -= 1
#       print "You have #{i} chances left: "
#       input = gets.downcase.chomp
#     end

#     if i < 0
#       return "He's dead....you killed him...."
#     end
#   end
# end


# # input = gets.chomp.downcase
# # if word.include?(input)
# #   puts show.gsub()

# if input == word.join('')
#   return "You Win!"
# end



# # puts "Word: #{}"
