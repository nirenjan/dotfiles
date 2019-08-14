#!/bin/bash -x
# Get the latest release of Hugo from GitHub releases

# Releases URL
readonly RELEASES='https://api.github.com/repos/gohugoio/hugo/releases/latest'

# JQ Filter
SELECT='.browser_download_url'
LINUX_FILT='test("Linux-64bit.tar.gz")'
EXT_FILT='test("extended")'

readonly FILTER=".assets[]|select($SELECT|$LINUX_FILT)|select($SELECT|$EXT_FILT)|$SELECT"

if ! command -v curl &>/dev/null
then
    echo "Need curl in order to proceed" >&2
    exit 1
fi

if ! command -v jq &>/dev/null
then
    echo "Need jq in order to proceed" >&2
    exit 1
fi

# Get the path to the latest release tarball
HUGO_TGZ=$(curl -sSL "$RELEASES" | jq "$FILTER" | sed 's/"//g')

# Download the Hugo tarball and extract the hugo binary
rm -f hugo
curl -sSL "$HUGO_TGZ" | tar zxf - hugo || 
    {
        echo "Cannot find hugo" >&2
        exit 1
    }

