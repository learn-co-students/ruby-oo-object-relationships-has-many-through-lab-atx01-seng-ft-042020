class Genre 
    @@all = []

    attr_accessor :name
    def initialize(name)
        @name = name
        @@all << self
    end

    def songs 
        Song.all.select {|song| song.genre.name == self.name} 
    end

    def artists
        self.songs.map {|song| song.artist}.uniq
    end

    def self.all
        @@all
    end

end