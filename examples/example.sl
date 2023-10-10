#!/bin/bash

#SBATCH --mem=128gb                         # requested RAM
#SBATCH --time=168:00:00                    # max time
#SBATCH -o example.%N.%j.out                # STDOUT
#SBATCH -e example.%N.%j.out                # STDERR
#SBATCH --nodes=1                           # num of nodes
#SBATCH --cpus-per-task=28                  # num of cores
#SBATCH --mail-type=END                     # event/s to report by mail
#SBATCH --mail-user=example@example.com     # mail address

# Load modules, activate environments, export paths here:
#
#
#
#####
# You can define arguments that are passed to this script using bash $# (# - any number)", e.g:
#
# var=$1
# var_second=$2
#
#####
# You can define here what should be logged to STDOUT using following structure:
#
# cat << EOF
# write whatever you want (just like that, as plain text, no need for ' or ")
#
#####
# You can write the commands you want to execute. You can mix it with the logging, shown above. For example:
#
# mkdir ./example_results
# Starting example...
# python example.py -i $var -u $var_second -o ./example_results
#
#####
# Finish file (just in case). Everything what was logged in here will be in example.%N.%j.out
#
# cat << EOF
# EOF