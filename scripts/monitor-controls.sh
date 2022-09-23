#!/usr/bin/env sh

brightness() {
    up10=""
    down10=""
    cancel="Cancel"

    while true; do
        brightness="$(ddcutil -t getvcp 10 | cut -d ' ' -f 4)"
        option="$($dmenu -p " $brightness" <<EOF
$up10
$down10
$cancel
EOF
        )" || exit

        case $option in
            "$up10")
                ddc_call setvcp 10 + 10
                ;;
            "$down10")
                ddc_call setvcp 10 - 10
                ;;
            *)
                ddc_call setvcp 10 "$option"
                break
                ;;
        esac
    done
}

displays() {
    if [ -f /tmp/ddc_diplays ]; then
        cat /tmp/ddc_diplays
    else
        ddcutil detect -t | awk '/^Display/ {print $2}' | tee /tmp/ddc_diplays
    fi
}

ddc_call() {
    displays | xargs -I{} ddcutil --display "{}" $@
}


# dmenu="rofi -dmenu -no-fixed-num-lines -i"
# dmenu="wofi -d"
dmenu="bemenu --scrollbar autohide -s -n -w -c -l8 -M 40 -H 20"

brightness
