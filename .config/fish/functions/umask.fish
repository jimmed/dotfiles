# Defined in /usr/share/fish/functions/umask.fish @ line 151
function umask --description 'Set default file permission mask'
	set -l options 'h/help' 'p/as-command' 'S/symbolic'
    argparse -n umask $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help umask
        return 0
    end

    switch (count $argv)
        case 0
            set -q umask
            or set -g umask 113

            if set -q _flag_as_command
                echo umask $umask
            else if set -q _flag_symbolic
                __fish_umask_print_symbolic $umask
            else
                echo $umask
            end

        case 1
            if set -l parsed (__fish_umask_parse $argv)
                set -g umask $parsed
                return 0
            end
            return 1

        case '*'
            printf (_ '%s: Too many arguments\n') umask >&2
            return 1
    end
end
