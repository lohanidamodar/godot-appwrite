extends Control
export(PackedScene) var home

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#$HTTPRequest.connect("request_completed", self,"_on_request_completed")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_LoginButton_pressed():
	var data = {
		"email": $BG/VBoxContainer/Username.text,
		"password": $BG/VBoxContainer/password.text
	}
	var query = JSON.print(data)

	var http = HTTPRequest.new()
	add_child(http)
	http.connect("request_completed", self,"_on_request_completed")
	http.request(
		Appwrite.endpoint+'/account/sessions',
		Appwrite.headers,
		false,
		HTTPClient.METHOD_POST,
		query
	)
	
	
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
#	print(json.result)
#	print(headers)
	var cookies = PoolStringArray()
	for h in headers:
		if h.to_lower().begins_with("set-cookie"):
			cookies.append(h.split(":", true, 1)[1].strip_edges().split("; ")[0])
			
	if json.result.has("$id"):
		Appwrite.set_cookies("Cookie: %s" % cookies.join("; "))
		print("login successful")
		get_tree().change_scene_to(home)
