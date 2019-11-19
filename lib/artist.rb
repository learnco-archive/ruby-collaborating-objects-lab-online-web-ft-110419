class Artist
  attr_accessor :name

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    # self.class.all << self
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
    # TODO
  end
end
