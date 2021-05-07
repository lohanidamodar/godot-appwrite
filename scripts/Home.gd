extends Control
var projectId="60836fae0daa3" # YOUR_APPWIRITE_PROJECT_ID
var endpoint="https://localhost/v1" # YOUR_APPWRITE_END_POINT

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var http = HTTPRequest.new()
	add_child(http)
	http.connect("request_completed", self,"_on_request_completed")
	
	http.request(
		endpoint+'/account',
		Appwrite.headers,
		false,
		HTTPClient.METHOD_GET
	)



func _on_request_completed(result,code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
	if(json.result.has("$id")):
		Appwrite.user = json.result
		$BG/VBoxContainer/Email.text = json.result["email"]
		$BG/VBoxContainer/Name.text = json.result["name"]
