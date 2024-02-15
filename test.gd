extends Node

@onready var register_guest_button := %RegisterGuestButton
@onready var logout_button := %LogoutButton
@onready var status_label := %StatusLabel


func _ready() -> void:
	var logged_in := PlayerAccounts.is_logged_in()
	_update_buttons()
	if not PlayerAccounts.auth_token:
		status_label.text = "Please set the auth token in Project Settings -> Quiver -> General."
	elif logged_in:
		status_label.text = "Player logged in."
	else:
		status_label.text = "Player not logged in."

func _update_buttons():
	var logged_in := PlayerAccounts.is_logged_in()
	register_guest_button.disabled = logged_in
	logout_button.disabled = !logged_in


func _disable_buttons():
	register_guest_button.disabled = true
	logout_button.disabled = true


func _on_register_guest_button_pressed() -> void:
	_disable_buttons()
	status_label.text = "Registering"
	var result = await PlayerAccounts.register_guest()
	if result:
		_update_buttons()
		status_label.text = "Player registered guest account successfully."
	else:
		_update_buttons()
		status_label.text = "Player registration failed."


func _on_logout_button_pressed() -> void:
	PlayerAccounts.log_out()
	_update_buttons()
	status_label.text = "Player was logged out."
