class Song 
  attr_accessor :artist, :name, :artist_name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    song = self.new(filename.split(" - ")[1])
    song.artist_name = (filename.split(" - ")[0])
    song
  end
  
end