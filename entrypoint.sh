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
[[ -n "$INPUT_POSTMAN" ]] && POSTMAN_PARAM="--postman=$INPUT_POSTMAN"
[[ -n "$INPUT_RETRY" ]] && RETRY_PARAM="--retry=$INPUT_RETRY"
[[ -n "$INPUT_RETRY_DELAY" ]] && RETRY_DELAY_PARAM="--retry-delay=$INPUT_RETRY_DELAY"
[[ -n "$INPUT_PROXY_URL" ]] && PROXY_URL_PARAM="--proxy-url=$INPUT_PROXY_URL"
[[ -n "$INPUT_PROXY_PORT" ]] && PROXY_PORT_PARAM="--proxy-port=$INPUT_PROXY_PORT"
[[ -n "$INPUT_POLL_TIMEOUT" ]] && POLL_TIMEOUT_PARAM="--poll-timeout=$INPUT_POLL_TIMEOUT"
[[ -n "$INPUT_POLL_INTERVAL" ]] && POLL_DELAY_PARAM="--poll-ticker=$INPUT_POLL_INTERVAL"
[[ -n "$INPUT_RECORDING_PATH" ]] && RECORDING_PATH="--recording-path=$INPUT_RECORDING_PATH"


####################
# Run DAST Scan    #
####################
cd "$GITHUB_WORKSPACE" || exit
echo "${DATETIME} - INF : DAST command - dast $INPUT_COMMAND $ENVIRONMENT_ID_PARAM $INPUT_PARAM $BASE_URL_PARAM $OUTPUT_PARAM $TIMEOUT_PARAM $UPDATE_INTERVAL_PARAM $JVM_PROPERTIES_PARAM $LOG_LEVEL_PARAM $VERBOSE_PARAM $FAIL_ON_PARAM $OPENAPI_PARAM $POSTMAN_PARAM $RETRY_PARAM $RETRY_DELAY_PARAM $PROXY_URL_PARAM $PROXY_PORT_PARAM $POLL_TIMEOUT_PARAM $POLL_DELAY_PARAM $RECORDING_PATH"

/app/bin "$INPUT_COMMAND" "$ENVIRONMENT_ID_PARAM" "$INPUT_PARAM" "$BASE_URL_PARAM" "$OUTPUT_PARAM" "$TIMEOUT_PARAM" "$UPDATE_INTERVAL_PARAM" "$JVM_PROPERTIES_PARAM" "$LOG_LEVEL_PARAM" "$VERBOSE_PARAM" "$FAIL_ON_PARAM" "$OPENAPI_PARAM" "$POSTMAN_PARAM" "$RETRY_PARAM" "$RETRY_DELAY_PARAM" "$PROXY_URL_PARAM" "$PROXY_PORT_PARAM" "$POLL_TIMEOUT_PARAM" "$POLL_DELAY_PARAM" "$RECORDING_PATH"
