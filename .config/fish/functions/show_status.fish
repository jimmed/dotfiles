# Defined in /tmp/fish.050MSq/show_status.fish @ line 2
function show_status --description 'Function to show the current status'
	if [ $RETVAL -ne 0 ]
    prompt_segment red white "$RETVAL"
    set pad ""
    end
  if [ -n "$SSH_CLIENT" ]
      prompt_segment blue white " SSH: "
      set pad ""
    end
end
