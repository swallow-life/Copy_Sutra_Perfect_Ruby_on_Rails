#10.10
class BasicAuth
	def initialize(app, username, password)
		@app = app
		@username = username
		@password = password
	end

	def call(env)
		#10.11
		if auth_header = env["HTTP_AUTHORIZATION"]
			credentials = auth_header.scan(/Basic (.+)/).flatten.first
			#「ユーザ名:パスワード」というフォーマットで格納されている
			username, password = Base64.decode64(credentials).split(":", 2)
			#10.12
			if username == @username && password == @password
				return @app.call(env)
			end
		end
		# 認証情報がない、または間違っている場合
		return request_credentials
	end

	#10.12
	private
	def request_credentials
		[
			401,
			{"WWW-Authenticate" => %Q(Basic realm="INPUT CREDENTIALS")},
			["Authentication failed!"]
		]
	end
end
