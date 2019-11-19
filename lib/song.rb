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

  def self.new_by_filename(filename)
    artist, song_name = filename.split(" - ")
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist)
    song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
