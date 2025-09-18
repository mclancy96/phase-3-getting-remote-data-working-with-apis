require "net/http"
require "open-uri"
require "json"

class GetPrograms
  URL = "https://bronx.lehman.cuny.edu/resource/x9zi-ukip.json".freeze

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def program_school
    programs = JSON.parse(get_programs)
    programs.collect do |program|
      program["agency"]
    end
  end
end

programs = GetPrograms.new
puts programs.program_school
