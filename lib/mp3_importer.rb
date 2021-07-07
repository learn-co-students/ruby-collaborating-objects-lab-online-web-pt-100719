class MP3Importer
  attr_accessor :path
  def initialize(test_music_path)
    @path = test_music_path
  end
  def files
    Dir.entries(@path).select do |file|
      file.include?("mp3")
    end
  end
  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
  
end