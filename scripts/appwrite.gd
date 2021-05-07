extends Node

var projectId="60836fae0dae5"
var endpoint="https://ap.popupbits.com/v1"

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
