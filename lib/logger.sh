# COLORS
RED='\033[0;31m'    # For issues
GREEN='\033[0;32m'  # For success
YELLOW='\033[0;33m' # For warnings
GRAY='\033[1;30m'   # For simple log messages
NO_COLOR='\033[0m'  # For clearing color

function logger() {
	# PARAMETERS
	local LOG_TYPE=$1
	local LOG_MSG=$2
	

	# VARIABLES
	local COLOR=${NO_COLOR}
	local TYPE="INFO"

	case "${LOG_TYPE}" in
		success)
			COLOR=${GREEN}
			TYPE="SUCCESS"
			;;
		warn)
			COLOR=${YELLOW}
			TYPE="WARN"
			;;
		fail)
			COLOR=${RED}
			TYPE="FAIL"
			;;
		info)
			COLOR=${GRAY}
			TYPE="INFO"
			;;
		*)
			COLOR=${NO_COLOR}
			TYPE="LOGGER"
			;;
	esac
	echo -e "${COLOR}[${TYPE}]${NO_COLOR} $LOG_MSG"
}
