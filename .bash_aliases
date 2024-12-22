# GnuPG commands
alias gpg-rst='gpgconf --kill gpg-agent'
alias gpg-st='gpg --card-status'

# osx like commands
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboad --output'

# print current time in desired timezones
function ptz() {
    localtime="[your local timezone]"

    if [ $# -eq 0 ]
    then
    # Print timezones against current time
        echo "Local (${localtime}): "$(TZ="$localtime" date)
        echo "Vancouver: "$(TZ="America/Vancouver" date)
        echo "Toronto:   "$(TZ="America/Toronto" date)
        echo "UTC:       "$(TZ="UTC" date)
        echo "Nairobi:   "$(TZ="Africa/Nairobi" date)
        echo "Saigon:    "$(TZ="Asia/Saigon" date)
        echo "Kyoto:     "$(TZ="Asia/Tokyo" date)
    else
    # Print timezones relative to a desired timezone
        echo "Local (${localtime}): "$(TZ="$localtime" date --date="TZ=\"$1\" $2")
        echo "Vancouver: "$(TZ="America/Vancouver" date --date="TZ=\"$1\" $2")
        echo "Toronto:   "$(TZ="America/Toronto" date --date="TZ=\"$1\" $2")
        echo "UTC:       "$(TZ="UTC" date --date="TZ=\"$1\" $2")
        echo "Nairobi:   "$(TZ="Africa/Nairobi" date --date="TZ=\"$1\" $2")
        echo "Saigon:    "$(TZ="Asia/Saigon" date --date="TZ=\"$1\" $2")
        echo "Kyoto:     "$(TZ="Asia/Tokyo" date --date="TZ=\"$1\" $2")
        fi
    }
}

# cheatsheet popup
alias i3cheatsheet='egrep ^bind ~/.config/i3/config | cut -d '\'' '\'' -f 2- | sed '\''s/ /\t/'\'' | column -ts $'\''\t'\'' | pr -2 -w 145 -t | less'

# k8s shortcuts
alias kev="kubectl get events --sort-by='.lastTimestamp'"
alias kubectl='kubecolor'
alias k='kubectl'

function kns() {
    #$1: the kube namespace
    kubectl config set-context --current --namespace=$1
}

function kconf() {
    #$1: the target ~/.kube/config.x
    rm ~/.kube/config
    ln -s ~/.kube/config.$1 ~/.kube/config
}

# terraform/terragrunt
alias tf='terraform'
alias tg='terragrunt'

## WIFI/Network commands
function wifiscan() {
    #nmcli -f "CHAN,BARS,SIGNAL,SSID" d wifi list ifname wlp3s0  | sort -n
    #nmcli -f "CHAN,BARS,SIGNAL,SSID" d wifi list ifname wlp3s0
    nmcli -o -p d wifi
}

function wifiup() {
    nmcli radio wifi on
}

function wifidown() {
    nmcli radio wifi off
}

function netmon() {
    nload -t 200 -i 1024 -o 128 -U H wlan0
}

