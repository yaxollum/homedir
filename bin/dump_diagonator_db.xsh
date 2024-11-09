#!/usr/bin/env xonsh

import time
sqlite3 $DIAGONATOR_ANALYTICS_FILE .dump > ~/.backup/@(time.strftime("%Y-%m-%d"))-diagonator-analytics.sql
ls -l ~/.backup
