setup-git-shorthands

set -x GOPATH /usr/lib/local/golang/
set -x EDITOR vim
set -x PATH (yarn global bin) $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.deno/bin $PATH
set -x default_user jim

cat ~/.cache/wal/sequences

# source ~/.cargo/env

alias git=hub

function handle_input_bash_conditional --description 'Function used for binding to replace && and ||'
    # This function is expected to be called with a single argument of either & or |
    # The argument indicates which key was pressed to invoke this function
    if begin; commandline --search-mode; or commandline --paging-mode; end
        # search or paging mode; use normal behavior
        commandline -i $argv[1]
        return
    end
    # is our cursor positioned after a '&'/'|'?
    switch (commandline -c)[-1]
    case \*$argv[1]
        # experimentally, `commandline -t` only prints string-type tokens,
        # so it prints nothing for the background operator. We need -c as well
        # so if the cursor is after & in `&wat` it doesn't print "wat".
        if test -z (commandline -c -t)[-1]
            # Ideally we'd just emit a backspace and then insert the text
            # but injected readline functions run after any commandline modifications.
            # So instead we have to build the new commandline
            #
            # NB: We could really use some string manipulation operators and some basic math support.
            # The `math` function is actually a wrawpper around `bc` which is kind of terrible.
            # Instead we're going to use `expr`, which is a bit lighter-weight.

            # get the cursor position
            set -l count (commandline -C)
            # calculate count-1 and count+1 to give to `cut`
            set -l prefix (expr $count - 1)
            set -l suffix (expr $count + 1)
            # cut doesn't like 1-0 so we need to special-case that
            set -l cutlist 1-$prefix,$suffix-
            if test "$prefix" = 0
                set cutlist $suffix-
            end
            commandline (commandline | cut -c $cutlist)
            commandline -C $prefix
            if test $argv[1] = '&'
                commandline -i '; and '
            else
                commandline -i '; or '
            end
            return
        end
    end
    # no special behavior, insert the character
    commandline -i $argv[1]
end

function fish_user_key_bindings
    bind \& 'handle_input_bash_conditional \&'
    bind \| 'handle_input_bash_conditional \|'
end

alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

set -x NO_AT_BRIDGE 1

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/jim/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.fish ]; and . /home/jim/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.fish
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/jim/dev/mettle/ops-tool/node_modules/tabtab/.completions/serverless.fish ]; and . /home/jim/dev/mettle/ops-tool/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/jim/dev/mettle/ops-tool/node_modules/tabtab/.completions/sls.fish ]; and . /home/jim/dev/mettle/ops-tool/node_modules/tabtab/.completions/sls.fish

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
