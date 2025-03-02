# fish completion for snet

complete -c snet -f

complete -c snet -n '__fish_use_subcommand' -a list -d "List devices from database"
complete -c snet -n '__fish_seen_subcommand_from list' -s h -l help -d "Show this message and exit."
complete -c snet -n '__fish_use_subcommand' -a scan -d "Scan the network for devices information. [sudo]"
complete -c snet -n '__fish_seen_subcommand_from scan' -s h -l help -d "Show this message and exit."
complete -c snet -n '__fish_use_subcommand' -a check -d "Display information and Check which usernames in the database have internet access."
complete -c snet -n '__fish_seen_subcommand_from check' -s h -l help -d "Show this message and exit."
complete -c snet -n '__fish_use_subcommand' -a user-rate -d "Get the username, and optionally change the speed rate."
complete -c snet -n '__fish_seen_subcommand_from user-rate' -s h -l help -d "Show this message and exit."
complete -c snet -n '__fish_use_subcommand' -a device-info -d "Display the MAC and IP address of the current user."
complete -c snet -n '__fish_seen_subcommand_from device-info' -s h -l help -d "Show this message and exit."
complete -c snet -n '__fish_use_subcommand' -a add-blacklist -d "Add a MAC address to the blacklist."
complete -c snet -n '__fish_seen_subcommand_from add-blacklist' -s h -l help -d "Show this message and exit."
complete -c snet -n '__fish_seen_subcommand_from add-blacklist' -s d -l details -d "Additional details for the blacklisted MAC" 
complete -c snet -n '__fish_seen_subcommand_from add-blacklist'  
complete -c snet -n '__fish_use_subcommand' -a change-mac -d "Change the MAC address in Termux and restart the WiFi."
complete -c snet -n '__fish_seen_subcommand_from change-mac' -s h -l help -d "Show this message and exit."
complete -c snet -n '__fish_seen_subcommand_from change-mac'  
complete -c snet -n '__fish_use_subcommand' -a login -d "Login to the network with the provided username."
complete -c snet -n '__fish_seen_subcommand_from login' -s h -l help -d "Show this message and exit."
complete -c snet -n '__fish_seen_subcommand_from login' -s d -l delay -d "Delay between login attempts in seconds" -x -a "(for i in (seq 1 100); echo $i\t\"Number $i\"; end)"
complete -c snet -n '__fish_seen_subcommand_from login' -s l -l loop -d "Run in a loop until manually stopped" 
complete -c snet -n '__fish_seen_subcommand_from login' -s c -l count -d "Number of login attempts" -x -a "(for i in (seq 1 100); echo $i\t\"Number $i\"; end)"
complete -c snet -n '__fish_seen_subcommand_from login'  
complete -c snet -n '__fish_use_subcommand' -a completion -d "Generate a shell completion script for your preferred shell."
complete -c snet -n '__fish_seen_subcommand_from completion' -s h -l help -d "Show this message and exit."
complete -c snet -n '__fish_seen_subcommand_from completion'  -x -a "fish"
complete -c snet -n '__fish_use_subcommand' -s h -l help -d "Show this message and exit."
