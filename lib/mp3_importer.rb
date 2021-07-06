require 'pry'
class MP3Importer
    attr_reader :path
   
    def initialize(music_path)
        @path = music_path
    end

    def files 
       # binding.pry
        Dir.children(@path) 
        #also use Dir.entries(@path).reject w/ dots
        #or call skip first two entries with index
      end

    def import 
        #Song.new_by_filename is 
        #called 4 times
        self.files.each do |file_name|
            Song.new_by_filename(file_name)
        end
    end
end