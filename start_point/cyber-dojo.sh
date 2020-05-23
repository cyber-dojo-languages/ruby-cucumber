set -e

# ------------------------------------------------------------------------
# cyber-dojo returns text files under /sandbox that are
# created/deleted/changed. In tidy_up you can remove any
# such files you don't want returned to the browser.

trap tidy_up EXIT

function tidy_up()
{
  delete_dirs coverage
}

function delete_dirs()
{
  for dirname in "$@"
  do
      rm -rf "${dirname}" 2> /dev/null || true
  done
}

# ------------------------------------------------------------------------
# remove existing coverage report
[ -e report/coverage.txt ] && rm report/coverage.txt

# turn off colour in report/coverage.txt
export NO_COLOR=1

# -r option has to be specified for each named file
REQUIRES=""
for file in *_steps.rb; do
  REQUIRES+=" -r ${file}"
done

# Test output can be formatted as progress or documentation
cucumber --format progress . ${REQUIRES}
