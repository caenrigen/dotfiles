# ## Directories
# ## ===================================================================================
alias cdp="cd $HOME/Documents/ProjectsDev"

# ## Tools
# ## ===================================================================================
alias lc="limactl"

# ## Work: Fama
# ## ===================================================================================

alias tinyproxy_load="launchctl load ~/Library/LaunchAgents/com.user.tinyproxy-modem*"
alias tinyproxy_unload="launchctl unload ~/Library/LaunchAgents/com.user.tinyproxy-modem*"
alias modems_load="launchctl load ~/Library/LaunchAgents/com.user.ssh-modem*; tinyproxy_load"
alias modems_unload="launchctl unload ~/Library/LaunchAgents/com.user.ssh-modem*; tinyproxy_unload"
