source ../lib/logger.sh

function crafter(){  
	# VARIABLES
	local COMMAND=$1
	shift
	
	local PROJECT_NAME=""
	local PROJECT_LANG=""
	local PROJECT_TYPE=""
	
	# OPTIONS
	while getopts "n:l:t:" opt; do
		case "$opt" in
			n)
				PROJECT_NAME=$OPTARG
				;;
			l) 
                PROJECT_LANG=$OPTARG
				;;
			t)	
				PROJECT_TYPE=$OPTARG
				;;
			*)
				logger fail "Option $opt not recognized."
				logger fail "Please use crafter help."
				return 1
				;;
		esac
	done

	# COMMANDS
	
	shift $((OPTIND -1))
	
	case "$COMMAND" in 
		init)
			logger info "Initializing project..."
			logger info "Project NAME: $PROJECT_NAME"
			logger info "Project LANGUAGE: $PROJECT_LANG"
			logger info "Porject TYPE: $PROJECT_TYPE"
			;;
		help)
			logger info "Crafter is a CLI tool designed to simplify creation of projects."
			logger info "Available commands:"
			logger info "init	- Initializes a project"
			logger info "help	- Display command information"
			;;
		*)
			logger fail "Unrecognized command: $COMMAND"
			logger fail "Please use crafter help."
			;;
	esac
}
