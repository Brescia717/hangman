#!/usr/bin/env ruby

# Choose a word from word bank at random.
# Set chances to 8.
# If letter chosen is not in word, reduce chances by 1, else show letter.
# If word is guessed, you win, else you lose.

bank = ['something', 'goes', 'here']
word = bank.sample.downcase

hidden = ''
unchanged = ''
word.length.times do |l|
  l = '_'
  hidden << l
end
unchanged << hidden

length = (word.length - 1)
i = 0
chances = 8

puts "Welcome to Hangman!\n\n"
puts "Guess a letter, or the whole word. If you guess the whole word and are wrong, you lose."
puts "Word: \"#{hidden}\""
print "> "
guess = gets.chomp.downcase

while hidden != word
  if guess == word || hidden == word
    puts "\"#{word}\" is correct! You win"
    break
  elsif guess.length > 1 && guess != word
    puts "You lose."
    break
  elsif guess == ""
    chances -= 1
  else
    until i > length
      if word[i].include?(guess)
        hidden[i] = guess
      end
      i += 1
    end
    if unchanged == hidden
      chances -= 1
      unchanged = ''
      unchanged << hidden
    else
      unchanged = ''
      unchanged << hidden
    end
    if chances < 1
      puts "You lose."
      break
    end
    puts "Word: #{hidden}"

    if hidden == word
      puts "\"#{hidden}\" is correct! You win"
      break
    end

    i = 0
    print "You have #{chances} chances left: "
    guess = gets.chomp.downcase
  end
end
