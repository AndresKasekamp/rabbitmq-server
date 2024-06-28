#!/bin/sh

export RABBIT_USER
export RABBIT_PASS

# Create Rabbitmq user asynchronously and subshell
(
    rabbitmqctl wait --timeout 15 $RABBITMQ_PID_FILE
    rabbitmqctl add_user $RABBIT_USER $RABBIT_PASS 2>/dev/null
    rabbitmqctl set_user_tags $RABBIT_USER administrator
    rabbitmqctl set_permissions -p / $RABBIT_USER ".*" ".*" ".*"
    echo "User $RABBIT_USER has been created"
) &
rabbitmq-server
