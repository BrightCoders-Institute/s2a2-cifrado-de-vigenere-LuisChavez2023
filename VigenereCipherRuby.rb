# Luis Chavez Delgado 

# We create the Vigenere encryption module to build and define the methods, actions and variables to be used
module VigenereCipher
  # We define the starting point for the base of the alphabet
  BASE = 'A'.ord
  # We define the point of the size of the alphabet
  SIZE = 'Z'.ord - BASE + 1

  # We define a method to encrypt the message using text and cipher
  def encrypt(text, key)
    crypt(text, key, :+)
  end

  # We define a method to decrypt the message using encryption and text
  def decrypt(text, key)
    crypt(text, key, :-)
  end

  # We define a method to encrypt the message or word using the Vigenere encryption procedure
  def crypt(text, key, dir)
    text = text.upcase.gsub(/[^A-Z]/, '')
    key_iterator = key.upcase.gsub(/[^A-Z]/, '').chars.map { |c| c.ord - BASE }.cycle
    text.each_char.inject('') do |ciphertext, char|
      offset = key_iterator.next
      ciphertext << ((char.ord - BASE).send(dir, offset) % SIZE + BASE).chr
    end
  end
end

# We include the vigenere encryption module in our project
include VigenereCipher

# We make a function for the user to enter the word or message data
puts('Enter your word or message:')
# ·e save this data from the message or word in word
word = gets
puts('')
# We make a function for the user to enter the encryption
puts('Enter your encryption key:')
# We save that encryption in a variable called key
key = gets
puts('')

# We call the module, where we also send the word and the key as parameters
ciphertext = VigenereCipher.encrypt(word, key)

# We call the module, where we also send the ciphertext method and the key as parameters
recovered  = VigenereCipher.decrypt(ciphertext, key)

# We print with the puts the message or word that the user digitized
puts "Original: #{word}"
# Print the result of the encryption
puts "Encrypted: #{ciphertext}"
# Print the decryption result
puts "Decrypted: #{recovered}"
