class AddWards < ActiveRecord::Migration
  def self.up
    create_ward "Alta Vista", 18, "ALTA_VISTA.dat"
    create_ward "Barrhaven", 3, "BARRHAVEN.dat"
    create_ward "Bay", 7, "BAY.dat"
    create_ward "Beacon Hill-Cyrville", 11, "BEACON_HILL_CYRVILLE.dat"
    create_ward "Capital", 17, "CAPITAL.dat"
    create_ward "College", 8, "COLLEGE.dat"
    create_ward "Cumberland", 19, "CUMBERLAND.dat"
    create_ward "Gloucester-Southgate", 10, "GLOUCESTER_SOUTHGATE.dat"
    create_ward "Gloucester-South Nepean", 22, "GLOUCESTER_SOUTH_NEPEAN.dat"
    create_ward "Innes", 2, "INNES.dat"
    create_ward "Kanata North", 4, "KANATA_NORTH.dat"
    create_ward "Kanata South", 23, "KANATA_SOUTH.dat"
    create_ward "Kitchissippi", 15, "KITCHISSIPPI.dat"
    create_ward "Knoxdale-Merivale", 9, "KNOXDALE_MERIVALE.dat"
    create_ward "Orleans", 1, "ORLEANS.dat"
    create_ward "Osgoode", 20, "OSGOODE.dat"
    create_ward "Rideau-Goulbourn", 21, "RIDEAU_GOULBOURN.dat"
    create_ward "Rideau-Rockcliffe", 13, "RIDEAU_ROCKCLIFFE.dat"
    create_ward "Rideau-Vanier", 12, "RIDEAU_VANIER.dat"
    create_ward "River", 16, "RIVER.dat"
    create_ward "Somerset", 14, "SOMERSET.dat"
    create_ward "Stittsville-Kanata West", 6, "STITTSVILLE.dat"
    create_ward "West Carleton-March", 5, "WEST_CARLETON_MARCH.dat"
  end
  
  def self.create_ward(name, number, filename)
    ward = Ward.new(:name => name, :number => number);
    ward.save!
    
    path = File.join(File.join(File.dirname(__FILE__), "ward_data"), filename);
    File.open(path) do |f|
      f.each_line do |line|
        latlon = line.split(",")
        point = Point.new(:lat => latlon[0].to_f, :lon => latlon[1].to_f)
        point.ward = ward
        point.save!
      end
    end
  end

  def self.down
    Point.delete_all
    Ward.delete_all
  end
end
