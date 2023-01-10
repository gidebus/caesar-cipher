
# solution 1 modifies an array
def encrypt(message, key)
  encrypted_message = []

  message.each_byte do |ascii|
    if ascii.between?(65, 90)
      shifted_ascii = (((ascii + key) - 65) % 26) + 65;
      encrypted_message << shifted_ascii.chr
    elsif ascii.between?(97, 122)
      shifted_ascii = (((ascii + key) - 97) % 26) + 97;
      encrypted_message << shifted_ascii.chr
    else
      encrypted_message << ascii.chr
    end
  end
  encrypted_message.join('')
end

# solution 2 modifies a string
def encrypt(message, key)
  encrypted_message = ''

  message.each_char do |char|
    base = char.ord < 91 ? 65 : 97
    if char.ord.between?(65, 90) || char.ord.between?(97, 122)
      encryption = (((char.ord - base) + key) % 26) + base
      encrypted_message += encryption.chr
    else
      encrypted_message += char
    end
  end
  encrypted_message
end

encrypt('hola', 1)
