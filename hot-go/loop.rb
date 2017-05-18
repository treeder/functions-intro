require "http"

start = Time.now
begin
  # create HTTP client with persistent connection to api.icndb.com:
  http = HTTP.persistent "http://localhost:8080"

  # issue multiple requests using same connection:
  jokes = 100.times do |i|  
      r = http.post("/r/myapp/hot-go", :json=>{"name": "johnny #{i}"}) 
      puts r.to_s
    end
ensure
  # close underlying connection when you don't need it anymore
  http.close if http
end
puts "duration: #{Time.now - start}ms"
