#10.10
class BasicAuth
	def initialize(app, username, password)
		@app = app
		@username = username
		@password = password
	end

	def call(env)
		return [
			401,
			{"WWW-Authenticate" => %Q(Basic realm="INPUT CREDENTIALS")},
			["Authentication failed!"]
			]
	end
end
