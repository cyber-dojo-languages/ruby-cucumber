set -e

# --------------------------------------------------------------
# Text files under /sandbox are automatically returned...
source ~/cyber_dojo_fs_cleaners.sh
export REPORT_DIR=${CYBER_DOJO_SANDBOX}/report
function cyber_dojo_enter()
{
  # 1. Only return _newly_ generated reports.
  cyber_dojo_reset_dirs ${REPORT_DIR}
}
function cyber_dojo_exit()
{
  # 2. Remove text files we don't want returned.
  cyber_dojo_delete_dirs coverage # ...
  # cyber_dojo_delete_files # ...
}
cyber_dojo_enter
trap cyber_dojo_exit EXIT SIGTERM
# --------------------------------------------------------------

# turn off colour in report/coverage.txt
export NO_COLOR=1

# -r option has to be specified for each named file
REQUIRES=""
for file in *_steps.rb; do
  REQUIRES+=" -r ${file}"
done

# Test output can be formatted as progress or documentation
cucumber --format progress . ${REQUIRES}
