class MP3Importer
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files = Dir.glob("#{@path}/*.mp3").collect {|file| file.split("/")[-1]}
    @files
  end
  
  def import
    self.files.each{|file| Song.new_by_filename(file)}
  end
  
end