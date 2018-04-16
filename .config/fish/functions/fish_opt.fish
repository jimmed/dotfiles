# Defined in /usr/share/fish/functions/fish_opt.fish @ line 13
function fish_opt --description 'Produce an option specification suitable for use with `argparse`.'
	set -l options 'h/help' 's/short=' 'l/long=' 'o/optional-val' 'r/required-val'
    set options $options 'L-long-only' 'M-multiple-vals'
    argparse -n fish_opt --max-args=0 --exclusive=r,o --exclusive=M,o $options -- $argv
    or return

    if set -q _flag_help
        __fish_print_help fish_opt
        return 0
    end

    __fish_opt_validate_args
    or return

    set -l opt_spec $_flag_short

    if set -q _flag_long
        if set -q _flag_long_only
            set opt_spec "$opt_spec-"
        else
            set opt_spec "$opt_spec/"
        end
        set opt_spec "$opt_spec$_flag_long"
    end

    if set -q _flag_multiple_vals
        set opt_spec "$opt_spec=+"
    else if set -q _flag_required_val
        set opt_spec "$opt_spec="
    else if set -q _flag_optional_val
        and set opt_spec "$opt_spec=?"
    end

    echo $opt_spec
end
