#!/bin/bash

# Run database migrations
flask db upgrade

# Start the Flask app
flask run --host=0.0.0.0
