# Defined in /home/jim/.local/share/omf/pkg/fish-spec/functions/fish-spec.fish @ line 1
function fish-spec
	set -g __fish_spec_dir (dirname (dirname (status -f)))

  # Source formatter
  source $__fish_spec_dir/basic_formatter.fish

  # Reset internal variables
  set -e __any_spec_failed

  # Load each spec file
  for spec_file in spec/*_spec.fish
    source $spec_file
  end

  # Load helper file
  source spec/helper.fish ^/dev/null

  emit all_specs_init

  # Run all specs
  __fish-spec.run_all_specs

  emit all_specs_finished

  not set -q __any_spec_failed
end
