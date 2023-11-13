#!/bin/bash

wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
dpkg -i packages-microsoft-prod.deb
