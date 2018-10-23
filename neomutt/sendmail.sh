#!/bin/sh

mailer convert | msmtp -t -a "gmail"
