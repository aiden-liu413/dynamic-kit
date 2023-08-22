#!/bin/bash

#获取项目路径，容器环境约定为/data/app/工程名
APP_HOME=$(cd `dirname $0`/../&&pwd)
APP_NAME="dcimServer"

sed -i -e "s#\${CW_RUN_USER}#$CW_RUN_USER#g" \
    -e "s#\${CW_JVM_HEAP_SIZE}#$CW_JVM_HEAP_SIZE#g" \
    -e "s#\${CW_LOCAL_IP}#$CW_LOCAL_IP#g" \
    -e "s#\${CW_INSTALL_APP_DIR}#$CW_INSTALL_APP_DIR#g" \
    -e "s#\${CW_INSTALL_LOGS_DIR}#$CW_INSTALL_LOGS_DIR#g" \
    -e "s#\${CW_INSTALL_DATA_DIR}#$CW_INSTALL_DATA_DIR#g" \
    -e "s#\${CW_NACOS_SERVER}#$CW_NACOS_SERVER#g" \
    -e "s#\${CW_NACOS_USERNAME}#$CW_NACOS_USERNAME#g" \
    -e "s#\${CW_NACOS_PASSWORD}#$CW_NACOS_PASSWORD#g" \
    -e "s#\${CW_NACOS_NAMESPACE}#$CW_NACOS_NAMESPACE#g" \
    -e "s#\${CW_SERVICE_DBNAME}#$CW_SERVICE_DBNAME#g" \
    -e "s#\${CW_SERVICE_PORT}#$CW_SERVICE_PORT#g" \
    -e "s#\${CW_METRICS_PORT}#$CW_METRICS_PORT#g" \
    -e "s#\${CW_KAFKA_SERVER}#$CW_KAFKA_SERVER#g" \
    -e "s#\${CW_LOG_TOPIC}#$CW_LOG_TOPIC#g" \
    -e "s#\${OTHER_OPTS}#$OTHER_OPTS#g" ${APP_HOME}/bin/dcimServer

cd $APP_HOME
bash bin/$APP_NAME start -f