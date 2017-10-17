function push-and-pr --description 'Pushes to origin on the current branch and raises a pull request' --argument pr_title
	set current_branch (git rev-parse --abbrev-ref HEAD ^ /dev/null)
    if not [ $pr_title ]
        set pr_title (last-commit)
    end

    if [ $current_branch ]
        echo -s (set_color green) "Pushing to origin/$current_branch" (set_color normal)
        git push -u origin $current_branch
        echo -s (set_color green) "Raising pull request on GitHub..." (set_color normal)
        and pr $pr_title
        echo -s (set_color green) "Done!" (set_color normal)
    else
        echo -s (set_color red) "Not in a git repository" (set_color normal)
    end
end
