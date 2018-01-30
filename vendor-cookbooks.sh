#!/bin/bash

pushd cookbooks/dsek-website
berks vendor ../vendor 
popd
rm -r cookbooks/vendor/dsek-website

