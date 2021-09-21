#!/bin/bash

set -e

rails db:migrate
rails db:seed

exec "$@"