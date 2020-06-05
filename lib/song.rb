class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    s_filename = filename.split(/ - |.mp3/)
    song = Song.new
    song.name = s_filename[1]
    song.artist_name = s_filename[0]
    song
  end

  def self.create_from_filename(filename)
    s_filename = filename.split(/ - |.mp3/)
    song = Song.create_by_name(s_filename[1])
    song.artist_name = s_filename[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end