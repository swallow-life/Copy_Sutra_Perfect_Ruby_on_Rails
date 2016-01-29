#10.1
App = ->(env) do
	[200, {"Content-Type" => "text/html"}, ["Hello, Rack world!"]]
end
run App