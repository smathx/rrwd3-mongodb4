class TriResultsWS
  include HTTParty
  debug_output $stdout

  if ENV['C9_PROJECT'].nil?
    base_uri "http://localhost:3000"
  else
    base_uri "http://#{ENV['IP']}:#{ENV['PORT']}"
  end
end
