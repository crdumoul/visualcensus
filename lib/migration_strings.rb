
module MigrationStrings
  def MigrationStrings.census_uri(ward_number=1)
    'http://www.ottawa.ca/residents/statistics/census/wards/wardX_en.html'.sub(/X/, ward_number.to_s)
  end
end