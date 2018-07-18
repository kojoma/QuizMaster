class Utils::IntegerToEn
  def self.to_en!(integer)
    case integer
    when 0
      "zero"
    when 1
      "one"
    when 2
      "two"
    when 3
      "three"
    when 4
      "four"
    when 5
      "five"
    when 6
      "six"
    when 7
      "seven"
    when 8
      "eight"
    when 9
      "nine"
    when 10
      "ten"
    when 11
      "eleven"
    when 12
      "twelve"
    when 13
      "thirteen"
    when 14
      "fourteen"
    when 15
      "fifteen"
    when 16
      "sixteen"
    when 17
      "seventeen"
    when 18
      "eighteen"
    when 19
      "nineteen"
    when 20
      "twenty"
    when 30
      "thirty"
    when 40
      "forty"
    when 50
      "fifty"
    when 60
      "sixty"
    when 70
      "seventy"
    when 80
      "eighty"
    when 90
      "ninety"
    when 21 .. 99
      second_digit = integer % 10
      first_digit = integer - second_digit
      self.to_en!(first_digit) + "-" + self.to_en!(second_digit)
    when 100 .. 999
      first_digit = integer / 100
      other_digit = integer % 100
      if other_digit == 0
        self.to_en!(first_digit) + " hundred"
      else
        self.to_en!(first_digit) + " hundred and " + self.to_en!(other_digit)
      end
    else
      integer
    end
  end
end
