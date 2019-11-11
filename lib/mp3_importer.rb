class MP3Importer
    attr_reader :path

    def initialize(filepath)
        @path = filepath
    end

    def files
        file_array = Dir[@path + "/*"]
        file_array.map {|song_path| song_path.gsub(@path + "/", "")}
    end

    def import
        self.files.map do |song_filename|
            Song.new_by_filename(song_filename)
        end
    end

end
