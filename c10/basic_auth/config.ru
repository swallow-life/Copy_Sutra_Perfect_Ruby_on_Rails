#10.13
require "./basic_auth"

App = lambda do |env|
	[200, {"Content-Type" => "text/html"}, ["Hello, Rack world!"]]
end

use BasicAuth, "udzura", "password"
run App