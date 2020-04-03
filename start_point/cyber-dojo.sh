set -e

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
