case "$1" in
    on-workspace)
        [ -n "$2" ] || { echo "not enough args"; exit 1; }
        swaymsg -t get_tree |
            jq --arg name "$2" '
                recurse(.nodes[]) |
                select((.type == "workspace") and (.name == $name)).nodes[] |
                recurse(.nodes[]) |
                ([.app_id, .name, .pid] // empty)
            '
            ;;
    find-pid)
        [ -n "$2" ] || { echo "not enough args"; exit 1; }
        swaymsg -t get_tree |
            jq --arg pid "$2" '
                def find_workspace(path):
                    if (path | length) == 0 then
                        null
                    elif getpath(path) | try .type catch null == "workspace" then
                        getpath(path)
                    else
                        (. | find_workspace(path[:-1]))
                    end;

                [paths(.. | select(.pid == ($pid | tonumber))?)] as $p |
                    getpath($p | last).workspace = find_workspace($p | last).name |
                    getpath($p | last)
            '
        ;;
    rec-do)
        echo '{"foo": "bar"}' | jq '
            def slp(a):
            if (a | length) > 0 then
                a,slp(a[:-1])
            else
                empty
            end;

            # slp([1, 2, 3, 5])
            # path(.. | select(.pid == 1793337)?) as $p | slp($p)
        '
        ;;
    *) echo "unknown arg"; exit 1 ;;
esac
