require 'wikidata/fetcher'
require 'pry'

categories = [
  'Members_of_the_National_Assembly_(Angola)',
  'Presidents of the National Assembly (Angola)',
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
pt_names = WikiData::Category.new('Categoria:Políticos de Angola', 'pt').member_titles

EveryPolitician::Wikidata.scrape_wikidata(names: { en: people, pt: pt_names })
