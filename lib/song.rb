require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    s = self.new
    s.save
    s
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.find {|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else 
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|i| i.name }
  end

  def self.new_from_filename(file)
    split_file = file.sub(/.mp3/, '').split(' - ')
    new_song = self.new
    new_song.name = split_file[1]
    new_song.artist_name = split_file[0]
    new_song
  end

  def self.create_from_filename(file)
    split_file = file.sub(/.mp3/, '').split(' - ')
    new_song = self.new
    new_song.name = split_file[1]
    new_song.artist_name = split_file[0]
    new_song.save
  end

  def self.destroy_all
    @@all.clear
  end
end
