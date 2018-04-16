# Defined in /home/jim/.local/share/omf/pkg/omf/functions/cli/omf.cli.reload.fish @ line 1
function omf.cli.reload
	if not contains -- --force $argv
    if count (jobs) >/dev/null ^&1
      __omf.cli.reload.job_warning
      return 1
    end
  end
  omf.reload
end
