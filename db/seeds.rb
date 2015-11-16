# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

instruments = Instrument.create([{instrument: "EUR_USD"}, {instrument: "AUD_CAD"}])

granularities = Granularity.create([{granularity: "S5"}, 
                                    {granularity: "S10"}, 
                                    {granularity: "S15"}, 
                                    {granularity: "S30"}, 
                                    {granularity: "M1"}, 
                                    {granularity: "M2"}, 
                                    {granularity: "M3"}, 
                                    {granularity: "M4"}, 
                                    {granularity: "M5"}, 
                                    {granularity: "M10"}, 
                                    {granularity: "M15"}, 
                                    {granularity: "M30"},
                                    {granularity: "H1"},
                                    {granularity: "H2"},
                                    {granularity: "H4"},
                                    {granularity: "H6"},
                                    {granularity: "H8"},
                                    {granularity: "H12"},
                                    {granularity: "D"},
                                    {granularity: "W"},
                                    {granularity: "M"}])




