#!/usr/bin/bash

echo $(sh ./nerdbar.widget/scripts/time_script)@$(sh ./nerdbar.widget/scripts/date_script)@$(sh ./nerdbar.widget/scripts/battery_percentage_script)%@$(sh ./nerdbar.widget/scripts/battery_charging_script)@$(sh ./nerdbar.widget/scripts/wifi_status_script)@$(sh ./nerdbar.widget/scripts/spotify.sh)

