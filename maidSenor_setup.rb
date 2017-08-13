require 'dropbox_sdk'

APP_KEY = '736x4nf3i6ou1c1'
APP_SECRET = '4t55i6j9qq015pf'

flow = DropboxOAuth2FlowNoRedirect.new(APP_KEY, APP_SECRET)
authorize_url = flow.start()
puts '1. Go to: ' + authorize_url
puts '2. Click "Allow" (you might have to log in first)'
puts '3. Copy the authorization code'
print 'Enter the authorization code here: '
code = gets.strip
access_token, user_id = flow.finish(code)

File.open('access_token', 'w') { |file|
  file.write(access_token)
}