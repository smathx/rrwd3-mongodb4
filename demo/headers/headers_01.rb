response=TriResultsWS.get("/api/races/#{race.id}/results",:headers=>{"Accept"=>"application/json"})
response.response
# => #<Net::HTTPOK 200 OK  readbody=true>
response.header["Last-Modified"]
# => "Mon, 18 Jan 2016 09:23:07 GMT"
