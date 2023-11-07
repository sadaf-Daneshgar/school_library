class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end
end

def main
  app = App.new
  app.run
end

main
