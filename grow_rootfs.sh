#!/bin/bash

# Identify the root partition
ROOT_PARTITION=$(df / | tail -1 | awk '{print $1}')

# Resize the partition using parted
parted $ROOT_PARTITION resizepart 100%

# Resize the file system
resize2fs $ROOT_PARTITION
