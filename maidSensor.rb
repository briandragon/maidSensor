
require 'dropbox_sdk'

file = File.open('access_token', "rb")
access_token = file.read

client = DropboxClient.new(access_token)

puts "taking picture..."
system('raspistill -o camera_image.jpg')

puts "uploading..."
file = open('camera_image.jpg')
response = client.put_file('/latest.jpg', file)

puts "uploaded:", response.inspect