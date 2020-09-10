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

  def test_add_exhibit
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    expected = [gems_and_minerals, dead_sea_scrolls, imax]

    assert_equal expected, dmns.exhibits
  end

  def test_recommend_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("IMAX")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], dmns.recommend_exhibits(patron_1)
    assert_equal ["IMAX"], dmns.recommend_exhibits(patron_2)
  end

  def test_patrons_exist

    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_equal [], dmns.patrons
  end

  def test_admit

    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1 = Patron.new("Bob", 0)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3 = Patron.new("Johnny", 5)
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    assert_equal [patron_1, patron_2, patron_3], dmns.patrons

  end

  def test_patrons_by_exhibit_interest

    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1 = Patron.new("Bob", 0)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3 = Patron.new("Johnny", 5)
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    expected = {"Gems and Minerals"=>[patron_1], "Dead dead_sea_scrolls"=>[patron_1, patron_2, patron_3], "IMAX"=>[]}

    assert_equal expected, dmns.patrons_by_exhibit_interest
  end

  def test_ticket_lottery_contestant

  dmns = Museum.new("Denver Museum of Nature and Science")
  gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
  dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
  imax = Exhibit.new({name: "IMAX",cost: 15})
  dmns.add_exhibit(gems_and_minerals)
  dmns.add_exhibit(dead_sea_scrolls)
  dmns.add_exhibit(imax)
  patron_1 = Patron.new("Bob", 0)
  patron_1.add_interest("Gems and Minerals")
  patron_1.add_interest("Dead Sea Scrolls")
  patron_2 = Patron.new("Sally", 20)
  patron_2.add_interest("Dead Sea Scrolls")
  patron_3 = Patron.new("Johnny", 5)
  patron_3.add_interest("Dead Sea Scrolls")
  dmns.admit(patron_1)
  dmns.admit(patron_2)
  dmns.admit(patron_3)

  assert_equal [patron_1, patron_3], dmns.ticket_lottery_contestants(dead_sea_scrolls)
  end

  def test_draw_lottery_winner

    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1 = Patron.new("Bob", 0)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3 = Patron.new("Johnny", 5)
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    assert_equal "Johnny", dmns.draw_lottery_winner(dead_sea_scrolls)
    assert_equal "nil", dmns.draw_lottery_winner(gems_and_minerals)

  def test_announce_lottery_winner

  end

  dmns = Museum.new("Denver Museum of Nature and Science")
  gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
  dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
  imax = Exhibit.new({name: "IMAX",cost: 15})
  dmns.add_exhibit(gems_and_minerals)
  dmns.add_exhibit(dead_sea_scrolls)
  dmns.add_exhibit(imax)
  patron_1 = Patron.new("Bob", 0)
  patron_1.add_interest("Gems and Minerals")
  patron_1.add_interest("Dead Sea Scrolls")
  patron_2 = Patron.new("Sally", 20)
  patron_2.add_interest("Dead Sea Scrolls")
  patron_3 = Patron.new("Johnny", 5)
  patron_3.add_interest("Dead Sea Scrolls")
  dmns.admit(patron_1)
  dmns.admit(patron_2)
  dmns.admit(patron_3)

  assert_equal "Bob has won the IMAX edhibit lottery", dmns.announce_lottery_winner(imax)
  assert_equal "No winners for this lottery", dmns.announce_lottery_winner(gems_and_minerals)
  end
end
