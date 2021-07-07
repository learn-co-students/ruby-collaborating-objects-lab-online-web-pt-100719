class MP3Importer
    attr_reader :path

    def initialize(filepath)
        @path = filepath
    end

    def files
        files = Dir[@path + "/*"]
        files.collect { |song_path| song_path.gsub(@path + "/", "") }
    end

    def import
        self.files.collect { |filename| Song.new_by_filename(filename) }
    end

end