extends Node

var projectId="60836fae0daa3" # YOUR_APPWIRITE_PROJECT_ID
var endpoint="https://localhost/v1" # YOUR_APPWRITE_END_POINT

var headers=[
	'user-agent: godot-game/1.0',
	'Origin: http://localhost',
	'X-Appwrite-Project: '+projectId,
	'content-type: application/json'
]

var cookies = null
var user = null

func set_cookies(cookies):
	cookies = cookies
	headers.append(cookies)
