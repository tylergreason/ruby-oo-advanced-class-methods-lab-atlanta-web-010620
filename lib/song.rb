require 'pry' 
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initialize(name="") 
    @name = name 
  end 
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    a = Song.new() 
    a.save 
    a.class.all[-1]
  end

  def self.new_by_name(name) 
    new_song = Song.new(name) 
  end

  def self.create_by_name(name) 
    new_song = Song.new(name) 
    new_song.class.all << new_song 
    new_song.class.all[-1]
  end


  def self.find_by_name(input)
    i = 0 
    while i < @@all.length 
      if @@all[i].name == input 
        return @@all[i]
      end
      i+=1
    end
    return nil
  end

  def self.find_or_create_by_name(input) 
    if find_by_name(input) 
      return find_by_name(input)
    end
      create_by_name(input)
  end

  def self.alphabetical 
    @@all.sort_by {|index| index.name}
  end

  def self.new_from_filename(input) 
    selection_array = input.split(" - ")
    song_name = selection_array[1]
    song_name.slice!(".mp3")
    artist_name = selection_array[0]
    new_song = find_or_create_by_name(song_name)
    new_song.artist_name = artist_name
    return new_song 

    # this method didn't need to push to the Song.all array. 
  end
  
  def self.create_from_filename(input) 
    selection_array = input.split(" - ")
    song_name = selection_array[1]
    song_name.slice!(".mp3")
    artist_name = selection_array[0]
    new_song = find_or_create_by_name(song_name)
    new_song.artist_name = artist_name
    return new_song 
  end
  # binding.pry

  def self.destroy_all
    self.all.clear
  end

end
