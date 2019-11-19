require 'pry'
class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select { |s| s.artist == self }
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    self.all.find { |artist| artist.name == name } || Artist.new(name)
  end

  def print_songs
    self.songs.each { |song| puts song.name }
  end

  # def self.new_by_filename(filename)
  #   artist_name = filename.split(" - ")[0]
  # end

end
