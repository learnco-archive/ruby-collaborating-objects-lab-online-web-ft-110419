class Artist
  attr_accessor :name

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
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

  def self.find_or_create_by_name(filename)
    artist_name, song_name = filename.split(" - ")
    song = Song.new(song_name)

    self.all.detect { |artist| artist.name == name } || Artist.new(name).save
  end

  def save
    self.class.all << self
    self
  end

  def print_songs
    self.songs.each { |song| puts song.name }
  end
end
