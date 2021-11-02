#!/usr/bin/env sh

if (( $+commands[mmcli] )); then
  install -Dm 755 ./scripts/mm ${BINDIR}/mm
fi

# User Interface
function root_menu {
    o="Brightness\nCancel\n"
    
    option="$(echo -e "$o" | $rofi_command "Monitor Controls")"

    case $option in
        "Brightness")
            brightness
            ;;
    esac
}


function brightness {
    up10=""
    down10=""
    set="Set"
    cancel="Cancel"
    while true; do 
        brightness=$(ddcutil getvcp 10 | sed "s/ //g" | grep -o "\=[0-9]*" | sed "s/=//g" | paste -sd ',' | sed "s/\([0-9]*\),\([0-9]*\)/current \1 max \2/g")
        o="$up10\n$down10\n$set\n$cancel\n"
        option="$(echo -e "$o" | $rofi_command "Brightness: $brightness")"

        case $option in
            $up10)
                ddc_call setvcp 10 + 10
                ;;
            $down10)
                ddc_call setvcp 10 - 10
                ;;
            $set)
                brightness="$($rofi_command "Brightness")"
                ddc_call setvcp 10 $brightness
                break
                ;;
            *)
                if echo "$option" | grep -q "^[0-9]*$"; then
                    ddc_call setvcp 10 $option
                fi
                break
                ;;
        esac
    done
}

# Utility scripts
# TODO: This won't handle monitor hotplug
function displays {
    # if [[ -f /tmp/ddc_diplays ]]; then
    #     displays=$(cat /tmp/ddc_diplays)
    # else
        displays=$(ddcutil detect | grep "Display" | awk '{print $2}')
        echo "$displays" > /tmp/ddc_diplays # TODO: does this need -n?
    # fi
    echo -n $displays
}

function ddc_call {
    displays | xargs -d " " -I{} ddcutil --display "{}" $@
    # displays | xargs -d " " -I{} echo -n {} $@
}
ddc_call setvcp 10 $1
# displays


# Main
function run {
    if [ x"$@" = x"Cancel" ]
    then
        exit 0
    fi
}

# rofi_command="rofi -dmenu -no-fixed-num-lines -i -p"
rofi_command="wofi -d"

# root_menu
