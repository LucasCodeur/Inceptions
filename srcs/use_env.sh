#!/bin/sh

export $(xargs <.env)

# Load environment variables from .env file
# [ ! -f .env ] || export $(grep -v '^#' .env | xargs)
