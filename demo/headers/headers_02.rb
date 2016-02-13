response=TriResultsWS.get("/api/races/#{race.id}/results",:headers=>{"Accept"=>"application/json"})
response.response
# => #<Net::HTTPOK 200 OK  readbody=true>
last_modified=response.header["Last-Modified"]
# => "Mon, 18 Jan 2016 09:23:07 GMT"
response.content_length
# => 6420

last_modified
#  => "Mon, 18 Jan 2016 09:34:09 GMT"
response=TriResultsWS.get("/api/races/#{race.id}/results",:headers=>{"Accept"=>"application/json","If-Modified-Since"=>last_modified})
response.response
# => #<Net::HTTPNotModified 304 Not Modified  readbody=true>
response.header["Last-Modified"]
# => "Mon, 18 Jan 2016 09:34:09 GMT"
