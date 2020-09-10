class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    patron.interests
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patron_interests = {}

    @patrons.each do |patron|
      patron.interests.each do |interest|
        if patron_interests[interest]
          patron_interests[interest] << patron
        elsif !patron_interests[interest]
          patron_interests[interest] = [patron]
        end
      end
    end
    @exhibits.each do |exhibit|
    if !patron_interests.keys.include?(exhibit.name)
      patron_interests[exhibit.name] = []
    end
  end
    patron_interests
  end
end
