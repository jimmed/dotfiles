# Defined in /home/jim/.local/share/omf/pkg/omf/functions/core/omf.doctor.fish @ line 48
function omf.doctor
	echo "Oh My Fish version:   "(omf.version)
  echo "OS type:              "(uname)
  echo "Fish version:         "(fish --version)
  echo "Git version:          "(git --version)
  echo "Git core.autocrlf:    "(git config core.autocrlf; or echo no)

  __omf.doctor.fish_version; or set -l doctor_failed
  __omf.doctor.git_version; or set -l doctor_failed
  __omf.doctor.theme; or set -l doctor_failed

  if set -q doctor_failed
    echo "If everything you use Oh My Fish for is working fine, please don't worry and just ignore the warnings. Thanks!"
  else
    echo (omf::em)"Your shell is ready to swim."(omf::off)
  end
end
