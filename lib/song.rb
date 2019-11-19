require 'pry'
class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    binding.pry
    artist = self.class.all.detect { |song| song.artist.name == name || Artist.new(name) }
  end
end
