class Fixnum

  def to_bytes
    number = self.to_i
    if (number > 0 && number < 1024)
      "#{(number).round} Bytes"
    elsif (number >= 1024 && number < (1024*1024))
      "#{(number/1024).round} Kb"
    elsif (number >= (1024*1024) && number <(1024*1024*1024))
      "#{(number/1024/1024).round} Mb"
    end
  end

end