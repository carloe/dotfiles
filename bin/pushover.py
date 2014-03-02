#!/usr/bin/env python

import sys
import httplib, urllib
import argparse

def main():
	parser = argparse.ArgumentParser(description="cli interface to the pushover.net api")

	parser.add_argument('-u', "--user-key", help='a pushover user key')
	parser.add_argument('-t', "--token", help='a pushover app token')
	parser.add_argument('-m', "--message", help='the message to push')
	args = parser.parse_args()

	if args.token == None:
		parser.error("the app token argument is required")
		return 1
	elif args.user_key == None:
		parser.error("the user key argument is required")
		return 1
	elif args.message == None:
		parser.error("the message argument is required")
		return 1

	conn = httplib.HTTPSConnection("api.pushover.net:443")
	conn.request("POST", "/1/messages.json",
		urllib.urlencode({
			"token": str(args.token),
			"user": str(args.user_key),
			"message": str(args.message),
		}), { "Content-type": "application/x-www-form-urlencoded" }
	)
	content = conn.getresponse()
	if content.status != 200:
		print "Status: %i" % content.status
		return 1
	else:
		return 0
		conn.close()

if __name__ == "__main__":
	sys.exit(main())
