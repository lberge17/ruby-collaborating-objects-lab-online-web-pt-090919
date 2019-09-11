class Artist
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs
    Song.all.select{|song| song.artist == self}
  end
  
  def print_songs
    songs.each do |song|
      puts song.name
    end
  end
  
  def self.find_or_create_by_name(name)
    if !Artist.all.any?{|artist| artist.name == name}
      artist = Artist.new(name)
      artist.name = name
    end
      Artist.all.find{|artist| artist.name == name}
  end
  
  def self.all
    @@all
  end
  
end