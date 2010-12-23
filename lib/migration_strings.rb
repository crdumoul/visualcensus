
module MigrationStrings
  TABLE_NAMES = {
    'Population' => 'Population',
    'Total population by age groups' => 'Age Group',
    'Male, total' => 'Males by Age Group',
    'Female, total' => 'Females by Age Group',
    'Total number of children at home' => 'Children at Home',
    'Total Population by Mother Tongue' => 'Mother Tongue',
    'Total - Mobility status 1 year ago' => 'Mobility Status 1 Year Ago',
    'Total - Mobility status 5 years ago' => 'Mobility Status 5 Years Ago',
    'Total population by immigrant status and place of birth' => 'Immigrant Status and Place of Birth',
    'Total population by ethnic origin' => 'Ethnic Origin',
    'Total population 15 years and over by highest certificate, diploma or degree' => 'Highest Certificate Diploma or Degree',
    'Total number of occupied private dwellings' => 'Occupied Private Dwellings',
    'Structural Type' => 'Structural Type',
    'Tenure' => 'Tenure',
    'Period of construction' => 'Period of Construction',
    'Total number of private households by household size' => 'Household Size',
    'Total population 15 years and over by labour force activity' => 'Labour Force Activity',
    'Total labour force 15 years and over by occupation' => 'Occupation',
    'Total employment within ward by major sectors*' => 'Employment Sector',
    'Total employed labour force 15 years and over with usual place of work or no fixed workplace address by mode of transportation' => 'Transportation to Work',
    'Total income in 2005 of population 15 years and over' => 'Total Income',
    'Total income in 2005 of males 15 years and over' => 'Male Total Income',
    'Total income in 2005 of females 15 years and over' => 'Female Total Income',
    'Household income in 2005 of private households' => 'Household Income'
  }

  PERCENT_TABLES = [
    TABLE_NAMES['Total - Mobility status 1 year ago'],
    TABLE_NAMES['Total - Mobility status 5 years ago'],
    TABLE_NAMES['Total population by immigrant status and place of birth'],
    TABLE_NAMES['Total population by ethnic origin'],
    TABLE_NAMES['Total population 15 years and over by highest certificate, diploma or degree'],
    TABLE_NAMES['Total population 15 years and over by labour force activity'],
    TABLE_NAMES['Total labour force 15 years and over by occupation']
  ]

  ABSOLUTE_TABLES = [
    TABLE_NAMES['Population'],
    TABLE_NAMES['Total number of occupied private dwellings'],
    TABLE_NAMES['Total income in 2005 of population 15 years and over'],
    TABLE_NAMES['Total income in 2005 of males 15 years and over'],
    TABLE_NAMES['Total income in 2005 of females 15 years and over'],
    TABLE_NAMES['Household income in 2005 of private households']
  ]

  POPULATION_TABLES = [
    TABLE_NAMES['Population'],
    TABLE_NAMES['Total population by age groups'],
    TABLE_NAMES['Male, total'],
    TABLE_NAMES['Female, total'],
    TABLE_NAMES['Total number of children at home'],
    TABLE_NAMES['Total - Mobility status 1 year ago'],
    TABLE_NAMES['Total - Mobility status 5 years ago']
  ]

  DIVERSITY_TABLES = [
    TABLE_NAMES['Total Population by Mother Tongue'],
    TABLE_NAMES['Total population by immigrant status and place of birth'],
    TABLE_NAMES['Total population by ethnic origin']
  ]

  HOUSING_TABLES = [
    TABLE_NAMES['Total number of occupied private dwellings'],
    TABLE_NAMES['Structural Type'],
    TABLE_NAMES['Tenure'],
    TABLE_NAMES['Period of construction'],
    TABLE_NAMES['Total number of private households by household size']
  ]

  EMPLOYMENT_TABLES = [
    TABLE_NAMES['Total population 15 years and over by highest certificate, diploma or degree'],
    TABLE_NAMES['Total population 15 years and over by labour force activity'],
    TABLE_NAMES['Total labour force 15 years and over by occupation'],
    TABLE_NAMES['Total employment within ward by major sectors*'],
    TABLE_NAMES['Total employed labour force 15 years and over with usual place of work or no fixed workplace address by mode of transportation']
  ]

  INCOME_TABLES = [
    TABLE_NAMES['Total income in 2005 of population 15 years and over'],
    TABLE_NAMES['Total income in 2005 of males 15 years and over'],
    TABLE_NAMES['Total income in 2005 of females 15 years and over'],
    TABLE_NAMES['Household income in 2005 of private households']
  ]

  TOTAL_ROWS = [
    'Total population',
    'Male, total',
    'Female, total',
    'Total number of children at home',
    'Total Population',
    'Total - Mobility status 1 year ago',
    'Total - Mobility status 5 years ago',
    'Total population by immigrant status and place of birth',
    'Total population',
    'Total population 15 and over',
    'Total population 15 years and over',
    'Labour force 15 years and over',
    'Total 2006 employment',
    'Total employed labour force 15 years',
    'Total income in 2005 of population 15 years and over',
    'Total income in 2005 of males 15 years and over',
    'Total income in 2005 of females 15 years and over',
    'Household income in 2005 of private households'
  ]

  ROW_NAMES = {
    'Usual resident population - 100% data' => 'Usual Residents',
    'Total population excluding institutional residents 20% sample data' => 'Excluding Institutional Residents',
    'Total dwellings' => 'Total Dwellings',
    'Median income $ -' => 'Median Income',
    'Average income $ -' => 'Average Income',
    'Median after-tax income $ -' => 'Median After-Tax Income',
    'Average after-tax income $ -' => 'Average After-Tax Income',
    'Median household income $ -' => 'Median Household Income',
    'Average household income $ -' => 'Average Household Income',
    'Median after-tax household income $ -' => 'Median After-Tax Household Income',
    'Average after-tax household income $ -' => 'Average After-Tax Household Income'
  }

  def MigrationStrings.census_uri(ward_number=1)
    'http://www.ottawa.ca/residents/statistics/census/wards/wardX_en.html'.sub(/X/, ward_number.to_s)
  end
end
