class Solver
  def factorial(numb)
    if numb.zero?
      1
    elsif numb.positive?
      numb * factorial(numb - 1)
    else
      raise 'an exception'
    end
  end

  def reverse(word)
    word.reverse
  end

  def fizzbuzz(numb)
    if (numb % 3).zero? && (numb % 5).zero?
      'fizzbuzz'
    elsif (numb % 3).zero?
      'fizz'
    elsif (numb % 5).zero?
      'buzz'
    else
      numb.to_s
    end
  end
end
