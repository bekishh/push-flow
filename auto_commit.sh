#!/bin/bash

echo "$(date)" >> auto_update.txt

git add .

git commit -m "Auto commit on $(date)"

git push origin main
