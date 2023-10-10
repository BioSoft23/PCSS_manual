#!/bin/bash

# check if no arguments were passed
if [ $# -eq 0 ]; then
    echo "No arguments given. The -u argument for user must be set."
    exit 1
fi

username=""
all_jobs=false
job_name=""

while getopts ":an:u:" opt; do
  case ${opt} in
    a )
      all_jobs=true
      ;;
    n )
      job_name=$OPTARG
      ;;
    u )
      username=$OPTARG
      ;;
    \? ) echo "Usage: canel_jobs.sh [-a]: deletes all jobs (default) [-n job_name]: deletes job with specified name -u user"
      exit 1
      ;;
  esac
done

# check if user was passed
if [ -z "$username" ]; then
    echo "The -u argument for user is mandatory."
    exit 1
fi

if [ "$all_jobs" = false ] && [ -z "$job_name" ]; then
    all_jobs=true
fi

if [ "$all_jobs" = true ]; then
    jobids=$(squeue -o "%.18i %.9P %.128j %.8u %.2t %.10M %.6D %R" -u $username | awk 'NR>1 {print $1}')
    for jobid in $jobids
    do
        scancel $jobid
        echo "Job $jobid was cancelled"
    done
elif [ -n "$job_name" ]; then
    jobids=$(squeue -o "%.18i %.9P %.128j %.8u %.2t %.10M %.6D %R" -u $username | awk -v name=$job_name 'NR>1 && $3 == name {print $1}')
    for jobid in $jobids
    do
        scancel $jobid
        echo "Job $jobid ($job_name) was cancelled"
    done
fi