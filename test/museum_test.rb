require './lib/exhibit.rb'
require './lib/patron.rb'
require './lib/museum.rb'
require 'minitest/autorun'
require 'minitest/pride'

class ExhibitTest < Minitest::Test

  def test_it_exists_and_has_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_equal "Denver Museum of Nature and Science", dmns.name
    assert_equal [], dmns.exhibits
  end
end
