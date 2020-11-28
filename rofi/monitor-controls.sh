#!/usr/bin/env sh

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
                ddcutil setvcp 10 + 10
                ;;
            $down10)
                ddcutil setvcp 10 - 10
                ;;
            $set)
                brightness="$($rofi_command "Brightness")"
                ddcutil setvcp 10 $brightness
                break
                ;;
            *)
                if echo "$option" | grep -q "^[0-9]*$"; then
                    ddcutil setvcp 10 $option
                fi
                break
                ;;
        esac
    done
}

function run {
    if [ x"$@" = x"Cancel" ]
    then
        exit 0
    fi
}

rofi_command="rofi -dmenu -no-fixed-num-lines -i -p"

root_menu
