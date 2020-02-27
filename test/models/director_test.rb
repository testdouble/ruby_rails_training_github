require 'test_helper'

class DirectorTest < ActiveSupport::TestCase
  test "director has a name and age" do
    director = Director.create(name: "Bong Joon-ho", age: 50)

    assert director.name, "Bong Joon-ho"
    assert director.age, 50
  end
end
