response=TriResultsWS.get("/api/races/#{race.id}/results",:headers=>{"Accept"=>"application/json"});0
result_url=response.parsed_response.first["result_url"]
# => "http://localhost:3000/api/races/569a58b8e301d083c300008a/results/569a58c4e301d083c3002412"
response=HTTParty.patch(result_url,:body=>{:result=>{:swim=>15.minute}}.to_json,:headers=>{"Content-Type"=>"application/json","Accept"=>"application/json"})

last_modified
# => "Sun, 24 Jan 2016 09:08:45 GMT"
race.entrants.max(:updated_at)
# => 2016-01-24 09:50:02 UTC

last_modified
# => "Mon, 18 Jan 2016 09:34:09 GMT"
response=TriResultsWS.get("/api/races/#{race.id}/results",:headers=>{"Accept"=>"application/json","If-Modified-Since"=>last_modified});0
response.response
# => #<Net::HTTPOK 200 OK  readbody=true>
response.content_type
# => "application/json"
response.header["Last-Modified"]
# => "Sun, 24 Jan 2016 09:50:02 GMT"
