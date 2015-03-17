#
# Regular cron jobs for the ndn-perl package
#
0 4	* * *	root	[ -x /usr/bin/ndn-perl_maintenance ] && /usr/bin/ndn-perl_maintenance
