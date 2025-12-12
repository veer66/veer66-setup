#!/bin/bash

ujust _hhd-dev

systemctl stop hhd
systemctl disable hhd
systemctl enable hhd@$(whoami)
systemctl start hhd@$(whoami)