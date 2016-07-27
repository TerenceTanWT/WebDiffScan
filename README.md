This simple bash script checks a particular URL for changes every minute and will notify you via email when changes occur. 

I created this simple bash script right after iPhone 6s launch to
automatically check on SingTel’s iPhone stock status website every
minute, and to notify me of the stock changes via email. 

The email notification will not specify the changes, but will only
state that the website has been modified. 

To use this bash script, just execute it on any Linux machine. The
machine must have a mail sending service installed (e.g. postfix).
Configure it to relay emails via gmail SMTP. 

You can make the following changes to the script to suit your needs: 

**Line 7** - Enter the website to check 

**Line 10** - Enter your email for the script to send notifications 

**Line 19** and **26** - Enter the keywords to filter the website’s
source code. If you want to compare the entire website without
filtering, just remove the values in grep. If you do not filter, there
is a high chance that the script will detect changes every time as some
websites have dynamic content. The keywords in line 19 and 26 **MUST**
be the same, if not the script will detect changes every time. 

Line **Line 46** - If you do not want the script to check for differences
every minute, edit “1m” to other values accordingly. 
