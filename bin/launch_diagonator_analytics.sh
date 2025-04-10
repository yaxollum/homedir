#!/bin/bash

set -e

cd ~/dev/diagonator-server/analytics
source venv/bin/activate
cd diagonator_analytics
gunicorn main:app
