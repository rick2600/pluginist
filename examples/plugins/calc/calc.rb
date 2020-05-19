class Calc < Pluginist::Plugin
  description 'Calculator plugin'
  authors %w[me@email.com you@email.com]

  parameter :first, :integer, description: '1st operand'
  parameter :second, :integer, description: '2nd operand'
  parameter :op, :string, description: 'operation: (sum, sub, div, mul)'

  def run
    res = 0
    if op == '+'
      res = first + second
    elsif op == '-'
      res = first - second
    elsif op == '/'
      res = first / second
    elsif op == '*'
      res = first * second
    end
    puts res
  end
end
