function fish_prompt --description 'Write out the prompt'
    set -l suffix
    switch $USER
        case root toor
	    set suffix '⛏'
        case '*'
	    if is-git-repo
                if [ (git status --porcelain ^ /dev/null | grep "^??" | wc -l) -gt 0 ]
                    set suffix '💖'
                else
                    set suffix '💚'
                end
	    else
		set suffix '💔'
	    end
    end
    echo -n -s "$suffix  "
end
