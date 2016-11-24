require 'wikidata/fetcher'
require 'pry'

categories = [
  'Members_of_the_National_Assembly_(Angola)',
  'Government_ministers_of_Angola',
  'Defence_ministers_of_Angola',
  'Finance_ministers_of_Angola',
  'Prime_ministers_of_Angola',
  'Petroleum_ministers_of_Angola',
  'Foreign_ministers_of_Angola',
  'Energy_and_water_ministers_of_Angola',
  'Angolan_women_in_politics',
  'Angolan_politicians',
]

people = categories.map { |c| WikiData::Category.new( "Category:#{c}", 'en').member_titles }.reduce(:|)

EveryPolitician::Wikidata.scrape_wikidata(names: { en: people })
