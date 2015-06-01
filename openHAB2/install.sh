#!/bin/bash

echo "Installing openHAB2..."

# check if curl can be called
curl 2>/dev/null
rc=$?
# using openHAB2 alpha2 distribution
# follow redirects and ignore unsecure certs
if [ $rc -eq 2 ] ; then
  curl --insecure --location -s -o openhab-2.0.0.alpha2-demo.zip https://bintray.com/artifact/download/openhab/bin/openhab-2.0.0.alpha2-demo.zip
else
  # follow redirects and ignore unsecure certs
  # wget does work with these links. Use final download URL instead
  wget --no-check-certificate --quiet -O openhab-2.0.0.alpha2-demo.zip \
    "https://d29vzk4ow07wi7.cloudfront.net/a9f4d8d0bfebd7312e691143432cceb2bb52b21f?response-content-disposition=attachment%3Bfilename%3D%22openhab-2.0.0.alpha2-demo.zip%22&Policy=eyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6Imh0dHAqOi8vZDI5dnprNG93MDd3aTcuY2xvdWRmcm9udC5uZXQvYTlmNGQ4ZDBiZmViZDczMTJlNjkxMTQzNDMyY2NlYjJiYjUyYjIxZj9yZXNwb25zZS1jb250ZW50LWRpc3Bvc2l0aW9uPWF0dGFjaG1lbnQlM0JmaWxlbmFtZSUzRCUyMm9wZW5oYWItMi4wLjAuYWxwaGEyLWRlbW8uemlwJTIyIiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNDMzMTkxNjA1fSwiSXBBZGRyZXNzIjp7IkFXUzpTb3VyY2VJcCI6IjAuMC4wLjAvMCJ9fX1dfQ__&Signature=exaQ4U01dcNaDtoA2XXFXaP7Y6c6UKPMIiIEddASczckNKkBSPSpQhTxsnJwovXxYZLxRJUWrFWbAJO9Y0PKeRGYrQUxHGc3FkW1xfRoPUuyCB6D2aZy8bIMF72NICK65KiE7SufHgkie7xuuu9KCaPwKMe0wKv~vsDPZjyKO~y-Ogm8yCrrvIM~o~ZmlC~XzTSLSknbJWBubMSNKweEx010fz~yPnB3~72I~nlxgOHztMvqEpFOSKe1jzTRWQHLOmLGTaCCZqryx621047XxKLEhyL0KKpbXf29YRWgXagde9pF~hOF~cyVduvF4nb9pjiTV-iW1ZzzeVhFdERGYQ__&Key-Pair-Id=APKAIFKFWOMXM2UMTSFA"
fi
