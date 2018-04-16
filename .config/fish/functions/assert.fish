# Defined in /home/jim/.local/share/omf/pkg/fish-spec/functions/assert.fish @ line 1
function assert
	if builtin test $argv
    emit assertion_success
  else
    set -l assertion_status $status
    emit assertion_error (assert.error_message $argv)
    return $assertion_status
  end
end
