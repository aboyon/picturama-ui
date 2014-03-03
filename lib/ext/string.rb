class String

  def substring(char, end_with = '...')
    
    if (char < length)
      tmp = ''
      char.times do |char|
        tmp.concat(self[char])
      end
      tmp.concat('...')
    else
      self
    end

  end

end