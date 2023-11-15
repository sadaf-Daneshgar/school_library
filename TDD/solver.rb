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
end
