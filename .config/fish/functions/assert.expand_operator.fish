# Defined in /home/jim/.local/share/omf/pkg/fish-spec/functions/assert.expand_operator.fish @ line 1
function assert.expand_operator --argument operator
	switch $operator
    case =
      echo equals
    case \-z
      echo empty
    case \*
      echo $operator
  end
end
