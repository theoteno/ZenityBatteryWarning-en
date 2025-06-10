# Zenity Battery Warning App
- A script using Zenity (a tool that allows you to display GTK dialog boxes in commandline and shell scripts) to alert GNU/Linux users to maintain their battery hygiene:
    - When the battery is low (25% or less) and the disconnected adapter condition is met, it will advise the user to reconnect it;
    - if the battery level is high (80% or more) and the connected condition is met, advise the user to disconnect the adapter.
- The script runs in a loop and monitors the current battery status every 2 minutes.
- It's recommended to run the script after the user logs into the system (create a .desktop file for your script in the ~/.config/autostart directory).
- The messages in the dialogs are in English, were in Czech, because LukCogito uses Czech as the system language.
