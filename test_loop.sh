#!/bin/bash

for ((i=1; i<=10000; i++)); do
  ./obj_dir/Vtop
  if [ $? -eq 139 ]; then
    echo "Segmentation fault detected."
    break
  fi
done
