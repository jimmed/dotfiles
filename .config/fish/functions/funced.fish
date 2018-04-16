# Defined in /usr/share/fish/functions/funced.fish @ line 14
function funced --description 'Edit function definition'
	set -l options 'h/help' 'e/editor=' 'i/interactive'
    argparse -n funced --min-args=1 --max-args=1 $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help funced
        return 0
    end

    set funcname $argv[1]

    # Check VISUAL first since theoretically EDITOR could be ed.
    set -l editor
    if set -q _flag_interactive
        set editor fish
    else if set -q _flag_editor
        set editor $_flag_editor
    else if set -q VISUAL
        set editor $VISUAL
    else if set -q EDITOR
        set editor $EDITOR
    else
        set editor fish
    end

    set -l init
    switch $funcname
        case '-*'
            set init function -- $funcname\n\nend
        case '*'
            set init function $funcname\n\nend
    end

    # Break editor up to get its first command (i.e. discard flags)
    if test -n "$editor"
        set -l editor_cmd
        eval set editor_cmd $editor
        if not type -q -f "$editor_cmd[1]"
            echo (_ "funced: The value for \$EDITOR '$editor' could not be used because the command '$editor_cmd[1]' could not be found")
            set editor fish
        end
    end

    if test "$editor" = fish
        set -l IFS
        if functions -q -- $funcname
            # Shadow IFS here to avoid array splitting in command substitution
            set init (functions -- $funcname | fish_indent --no-indent)
        end

        set -l prompt 'printf "%s%s%s> " (set_color green) '$funcname' (set_color normal)'
        # Unshadow IFS since the fish_title breaks otherwise
        set -e IFS
        if read -p $prompt -c "$init" -s cmd
            # Shadow IFS _again_ to avoid array splitting in command substitution
            set -l IFS
            eval (echo -n $cmd | fish_indent)
        end
        return 0
    end

    # OSX mktemp is rather restricted - no suffix, no way to automatically use TMPDIR
    # Create a directory so we can use a ".fish" suffix for the file - makes editors pick up that it's a fish file
    set -q TMPDIR
    or set -l TMPDIR /tmp
    set -l tmpdir (mktemp -d $TMPDIR/fish.XXXXXX)
    set -l tmpname $tmpdir/$funcname.fish

    if functions -q -- $funcname
        functions -- $funcname >$tmpname
    else
        echo $init >$tmpname
    end

    # Repeatedly edit until it either parses successfully, or the user cancels
    # If the editor command itself fails, we assume the user cancelled or the file
    # could not be edited, and we do not try again
    while true
        set -l checksum (__funced_md5 "$tmpname")

        if not eval $editor $tmpname
            echo (_ "Editing failed or was cancelled")
        else
            # Verify the checksum (if present) to detect potential problems
            # with the editor command
            if set -q checksum[1]
                set -l new_checksum (__funced_md5 "$tmpname")
                if test "$new_checksum" = "$checksum"
                    echo (_ "Editor exited but the function was not modified")
                end
            end

            if not source $tmpname
                # Failed to source the function file. Prompt to try again.
                echo # add a line between the parse error and the prompt
                set -l repeat
                set -l prompt (_ 'Edit the file again\? [Y/n]')
                read -p "echo $prompt\  " response
                if test -z "$response"
                    or contains $response {Y,y}{E,e,}{S,s,}
                    continue
                else if not contains $response {N,n}{O,o,}
                    echo "I don't understand '$response', assuming 'Yes'"
                    sleep 2
                    continue
                end
                echo (_ "Cancelled function editing")
            end
        end
        break
    end

    set -l stat $status
    rm $tmpname >/dev/null
    and rmdir $tmpdir >/dev/null
    return $stat
end
