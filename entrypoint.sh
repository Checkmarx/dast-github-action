#!/bin/bash
DATETIME="$(date '+%H:%M')"

####################################
# Check if Command is Present      #
####################################
if [ -z "$INPUT_COMMAND" ]; then
    echo "${DATETIME} - ERR input command can't be empty"
    exit 1
fi

####################################
# Check if Config Path is Present  #
####################################
if [ -z "$INPUT_CONFIG" ]; then
    echo "${DATETIME} - ERR input config can't be empty"
    exit 1
else
    INPUT_PARAM="--config=$INPUT_CONFIG"
fi

####################################
# Check if base URL is Present     #
####################################
if [ -z "$INPUT_BASE_URL" ]; then
    echo "${DATETIME} - ERR input base_url can't be empty"
    exit 1
else
    BASE_URL_PARAM="--base-url=$INPUT_BASE_URL"
fi

####################################
# Check if base EnvID is Present   #
####################################

if [ -z "$INPUT_ENVIRONMENT_ID" ]; then
    echo "${DATETIME} - ERR input environment_id can't be empty"
    exit 1
else
    ENVIRONMENT_ID_PARAM="--environment-id=$INPUT_ENVIRONMENT_ID"
fi

###########################
# Set DAST Flags Values   #
###########################
[[ -n "$INPUT_OUTPUT" ]] && OUTPUT_PARAM="--output=$INPUT_OUTPUT"
[[ -n "$INPUT_TIMEOUT" ]] && TIMEOUT_PARAM="--timeout=$INPUT_TIMEOUT"
[[ -n "$INPUT_UPDATE_INTERVAL" ]] && UPDATE_INTERVAL_PARAM="--update-interval=$INPUT_UPDATE_INTERVAL"
[[ -n "$INPUT_JVM_PROPERTIES" ]] && JVM_PROPERTIES_PARAM="--jvm-properties=$INPUT_JVM_PROPERTIES"
[[ -n "$INPUT_LOG_LEVEL" ]] && LOG_LEVEL_PARAM="--log-level=$INPUT_LOG_LEVEL"
[[ -n "$INPUT_VERBOSE" ]] && VERBOSE_PARAM="--verbose"
[[ -n "$INPUT_FAIL_ON" ]] && FAIL_ON_PARAM="--fail-on=$INPUT_FAIL_ON"
[[ -n "$INPUT_OPENAPI" ]] && OPENAPI_PARAM="--openapi=$INPUT_OPENAPI"
[[ -n "$INPUT_PROJECT_ID" ]] && PROJECT_ID_PARAM="--project-id=$INPUT_PROJECT_ID"
[[ -n "$INPUT_RETRY" ]] && RETRY_PARAM="--retry=$INPUT_RETRY"
[[ -n "$INPUT_RETRY_DELAY" ]] && RETRY_DELAY_PARAM="--retry-delay=$INPUT_RETRY_DELAY"

####################
# Run DAST Scan    #
####################
cd "$GITHUB_WORKSPACE" || exit
echo "${DATETIME} - INF : DAST command - dast $INPUT_COMMAND $ENVIRONMENT_ID_PARAM $INPUT_PARAM $BASE_URL_PARAM $OUTPUT_PARAM $TIMEOUT_PARAM $UPDATE_INTERVAL_PARAM $JVM_PROPERTIES_PARAM $LOG_LEVEL_PARAM $VERBOSE_PARAM $FAIL_ON_PARAM $OPENAPI_PARAM $PROJECT_ID_PARAM $RETRY_PARAM $RETRY_DELAY_PARAM"

/app/bin "$INPUT_COMMAND" "$ENVIRONMENT_ID_PARAM" "$INPUT_PARAM" "$BASE_URL_PARAM" "$OUTPUT_PARAM" "$TIMEOUT_PARAM" "$UPDATE_INTERVAL_PARAM" "$JVM_PROPERTIES_PARAM" "$LOG_LEVEL_PARAM" "$VERBOSE_PARAM" "$FAIL_ON_PARAM" "$OPENAPI_PARAM" "$PROJECT_ID_PARAM" "$RETRY_PARAM" "$RETRY_DELAY_PARAM"
