# GnuPG commands
alias gpg-rst='gpgconf --kill gpg-agent'
alias gpg-st='gpg --card-status'

# osx like commands
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboad --output'

# print current time in desired timezones
function ptz() {
    localtime="America/Montevideo"
    if [ $# -eq 0 ]
    then
        echo "Local (${localtime}): "$(TZ="$localtime" date)
        echo "Vancouver: "$(TZ="America/Vancouver" date)
        echo "Toronto:   "$(TZ="America/Toronto" date)
        echo "UTC:       "$(TZ="UTC" date)
        echo "Nairobi:   "$(TZ="Africa/Nairobi" date)
        echo "Saigon:    "$(TZ="Asia/Saigon" date)
        echo "Kyoto:     "$(TZ="Asia/Tokyo" date)
    else
        echo "Local (${localtime}): "$(TZ="$localtime" date --date="TZ=\"$1\" $2")
        echo "Vancouver: "$(TZ="America/Vancouver" date --date="TZ=\"$1\" $2")
        echo "Toronto:   "$(TZ="America/Toronto" date --date="TZ=\"$1\" $2")
        echo "UTC:       "$(TZ="UTC" date --date="TZ=\"$1\" $2")
        echo "Nairobi:   "$(TZ="Africa/Nairobi" date --date="TZ=\"$1\" $2")
        echo "Saigon:    "$(TZ="Asia/Saigon" date --date="TZ=\"$1\" $2")
        echo "Kyoto:     "$(TZ="Asia/Tokyo" date --date="TZ=\"$1\" $2")
        fi
    }

# Enable noise cancelling in pulseaudio
function echoToggle() {
    aecArgs="$*"
    default="analog_gain_control=0 digital_gain_control=1 noise_suppression=1"
    # If no "aec_args" are passed on to the script, use this "aec_args" as default:
    [ -z "$aecArgs" ] && aecArgs="$default"
    newSourceName="echoCancelSource"
    newSinkName="echoCancelSink"

    # "module-switch-on-connect" with "ignore_virtual=no" (needs PulseAudio 12 or higher) is needed to automatically move existing streams to a new (virtual) default source and sink.
    if ! pactl list modules short | grep "module-switch-on-connect.*ignore_virtual=no" >/dev/null 2>&1; then
        echo Load module \"module-switch-on-connect\" with \"ignore_virtual=no\"
        pactl unload-module module-switch-on-connect 2>/dev/null
        pactl load-module module-switch-on-connect ignore_virtual=no
    fi

    # Reload "module-echo-cancel"
    echo Reload \"module-echo-cancel\" with \"aec_args=$aecArgs\"
    pactl unload-module module-echo-cancel 2>/dev/null
    if pactl load-module module-echo-cancel use_master_format=1 aec_method=webrtc aec_args=\"$aecArgs\" source_name=$newSourceName sink_name=$newSinkName; then
        # Set a new default source and sink, if module-echo-cancel has loaded successfully.
        pacmd set-default-source $newSourceName
        pacmd set-default-sink $newSinkName
    fi
}
