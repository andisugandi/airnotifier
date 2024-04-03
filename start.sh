#!/bin/bash
set -e

export LOGDIR="${LOGDIR:/var/log/airnotifier}"
export LOGFILE="${LOGFILE:airnotifier.log}"
export LOGFILE_ERR="${LOGFILE_ERR:airnotifier.err}"

if [ ! -f "./config.py" ]; then
  cp config.py-sample config.py
fi

sed -i 's/https = True/https = False/g' ./config.py

if [ ! -f "./logging.ini" ]; then
  cp logging.ini-sample logging.ini
fi

if [ ! -f "${LOGDIR}/${LOGFILE}" ]; then
   ln -sf /dev/stdout "${LOGDIR}/${LOGFILE}"
fi

if [ ! -f "${LOGDIR}/${LOGFILE_ERR}" ]; then
   ln -sf /dev/stderr "${LOGDIR}/${LOGFILE_ERR}"
fi


sed -i "s/mongouri = \"mongodb:\/\/localhost:27017\/\"/mongouri = \"mongodb:\/\/${MONGO_SERVER-localhost}:${MONGO_PORT-27017}\/\"/g" ./config.py
sed -i "s/mongohost = \"localhost\"/mongohost = \"mongodb\"/g"  ./config.py

echo "Installing AirNotifier ..."
pipenv run ./install.py

echo "Starting AirNotifier ..."
__starttimestamp=`date +%s.%N`
pipenv run ./app.py 
__runtime=$( echo "${__endtimestamp} - ${__starttimestamp}" | bc -l )
echo ${__runtime}
