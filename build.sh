#!/bin/bash

# Install Hugo Extended
HUGO_VERSION="0.119.0"
wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
tar -xzf hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz

# Move Hugo to a user-accessible directory
mkdir -p ~/bin
mv hugo ~/bin/hugo
export PATH=$PATH:~/bin

# Build the site
hugo -d public
