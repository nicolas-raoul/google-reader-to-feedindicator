# Converts a Google Reader subscriptions file and adds it to Feedindicator

# Create directory in case feedindicator has not been used yet.
mkdir -p ~/.config/feedindicator

# Convert and add to configuration.
grep xmlUrl subscriptions.xml /home/nico/Downloads/subscriptions.xml \
 | sed -e "s/.*xmlUrl=\"//" -e "s/\".*//" \
 >> ~/.config/feedindicator/feeds.cfg

# Restart.
ps aux | grep feedindicator | grep -v grep | awk '{ print $2; }' | xargs kill; feedindicator &
