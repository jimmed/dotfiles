# Defined in /home/jim/.local/share/omf/pkg/omf/functions/core/omf.destroy.fish @ line 1
function omf.destroy --description 'Remove Oh My Fish'
	# Run the uninstaller
  fish "$OMF_PATH/bin/install" --uninstall "--path=$OMF_PATH" "--config=$OMF_CONFIG"

  # Start a new OMF-free shell
  set -q CI; or exec fish < /dev/tty
end
