#!/bin/bash
# grader.sh <path/to/jupyter-> <variant> | less

cd $1
npm run start &

sleep 10
source $1/env
/home/lab/instrumentos/$2-gradeMe.sh

pid=$(lsof -ti :$PORT)
kill -9 ${pid}
