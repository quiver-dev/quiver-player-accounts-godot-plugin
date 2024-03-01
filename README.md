
# Quiver Player Accounts
Quiver Player Accounts allows you to easily player accounts for games using the  [Godot engine](https://godotengine.org). Currently this service only supports creating guest accounts, but in the future it will allow creating a whole host of accounts, supporting a variety of platforms.

## Features
* Currently just guest accounts, but a lot more in the future!

## Prerequisites
This plugin requires Godot 4.0 or later. It's been designed to work with GDScript. We'll add support for other languages in the future.

## Installation

### Install the plugin
* Grab the Player Accounts plugin from the Godot Asset Library (use the AssetLib view in the Godot editor) or copy the `quiver_player_accounts` directory in the [Github repo](https://github.com/quiver-dev/quiver-player-accounts-godot-plugin) to the `/addons/` directory in your project root.
* Go to your Project Settings -> Plugins and make sure the Quiver Player Accounts plugin is enabled.
* Close Project Settings and reopen it again. Go to the General tab and you should see a new "Quiver" section at the bottom of the left window.

### Configure the plugin
* Create an account on [quiver.dev](https://quiver.dev), if you haven't already.
* [Create a project](https://quiver.dev/projects/up/) on Quiver associated with your game, if you haven't already.
* Right now, we don't have a separate dashboard for player accounts. So to get your auth key, go to your project's leaderboards dashboard on the [Quiver Leaderboards page](https://quiver.dev/leaderboards/), go to the Settings tab, and copy the authentication token and then go to your Godot editor -> Project Settings -> Quiver -> General and paste your auth token.

### Test it!
* Somewhere in your game's code, add the following code:

	  var success: bool = await PlayerAccounts.register_guest()

If `success` is true, the call succeeded.

## Usage
The `PlayerAccounts` autoload is added to your project automatically when you enable the plugin.

### Registering a guest user

To post a score for a guest player account, call:

	await PlayerAccounts.register_guest()

The function returns a boolean indicating whether this operation succeeded. Note that this a coroutine, so must be called with the `await` keyword to get the result. When the player has logged in, the `logged_in` signal will be emitted.

### Logging out

To log a player out, call:

	PlayerAccounts.logout()

When the player has logged out, the `logged_out` signal will be emitted.

### Check login status

To see if the current user is logged into a player account:

	PlayerAccounts.is_logged_in()

This returns a boolean indicating whether the player is logged in.

## More Information

### Notes and Limitations

* Quiver Player Accounts only supports guest accounts, i.e. accounts with no login credentials. We'll support more types of accounts in the future.

### Troubleshooting

* If you run into issues, please post a message on [our Discord](https://discord.gg/NawdMR497X) or [contact us](https://quiver.dev/contact/).

### License

MIT License
