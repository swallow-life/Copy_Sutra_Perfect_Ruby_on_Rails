#10.6
class AddInfo
	def initialize(app)
		@app = app
	end

	def call(env)
		code, headers, body = @app.call(env)
		body.first.prepend "Path info is: #{env['PATH_INFO']}<br />"
		body.first.prepend "Accessed from: #{env['REMOTE_ADDR']}<br />"
		return [code, headers, body]
	end
end
#10.3
# class UpcaseAll
# 	def initialize(app)
# 		@app = app
# 	end

# 	def call(env)
# 		code, headers, body = @app.call(env)
# 		body.each{|part| part.upcase! }
# 		return [code, headers, body]
# 	end
# end

# #10.4
# class RackToRuby
# 	def initialize(app)
# 		@app = app
# 	end

# 	def call(env)
# 		code, headers, body = @app.call(env)
# 		body.each{|part| part.gsub! /Rack/i, 'Ruby' }
# 		return [code, headers, body]
# 	end
# end

#10.1
App = ->(env) do
	[200, {"Content-Type" => "text/html"}, ["Hello, Rack world!"]]
end

#10.5
# use RackToRuby
# use UpcaseAll
#10.3
# use UpcaseAll
#10.4
# use RackToRuby
#10.6
use AddInfo
run App