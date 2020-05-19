class Hello < Pluginist::Plugin
  description 'Hello plugin'
  authors %w[me@email.com you@email.com]
  tags %i[greetz]

  parameter :planet, :string, default: 'Earth', description: 'your planet'
  parameter :name, :string, description: 'your name'

  def run
    puts "Hello, I'm  #{name} from #{planet}."
  end
end
