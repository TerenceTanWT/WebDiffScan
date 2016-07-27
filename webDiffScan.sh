# Script created by @TerenceTanWT
#!/bin/bash

clear

# Website that you want to detect change
website="http://info.singtel.com/personal/phones-plans/mobile/ios/iphone6s-updates"

# Email address you want to send alert to
email=“myemail@yahoo.com.sg"

# Display welcome message
echo "Website change tracker developed by @TerenceTanWT"
echo "Website tracking: $website"
echo ""

# Download website source codes into originalWeb.txt and filter the stock status
curl -s $website > originalWeb.txt
cat originalWeb.txt | grep 'Not Available\|Selling Fast\|Available' > originalWeb-filtered.txt  # Filter the source codes

# Loop this continuously
while [ true ]; do

# After 1 minute, download the website source code into newWeb.txt and and filter the stock status
curl -s $website > newWeb.txt
cat newWeb.txt | grep 'Not Available\|Selling Fast\|Available' > newWeb-filtered.txt  # Filter the source codes

# Get hashes of both the text files containing the source codes
originalWeb="$(md5sum originalWeb-filtered.txt | awk '{ print $1 }')"
newWeb="$(md5sum newWeb-filtered.txt | awk '{ print $1 }')"

# Compare hashes of both text files
if [ "$originalWeb" != "$newWeb" ]
then

currentTime="$(date +'%Y-%m-%d %T')"   # Get current date time

echo "The website $website has been changed on $currentTime" > mail.txt   # Create the content of the email
mail -s "Website has changed!" $email < mail.txt    # Send the email
rm originalWeb-filtered.txt                 # Delete the original source code
mv newWeb-filtered.txt originalWeb-filtered.txt           # Rename the new source code to the original source code
echo "WEBSITE CHANGED!"

fi

sleep 1m            # Sleep for 1 minute so the scanning process repeats every 1 minute

done