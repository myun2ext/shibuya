#/bin/sh

if [ "$1" = "start" -o -z "$1" ]; then
  if [ -e /tmp/myun2.shibuya.unicorn.pid ]; then
    echo "Unicorn process has already been started."
  else
    bundle exec unicorn -c unicorn.rb -E production -D
    echo "Unicorn startuped"
  fi

elif [ "$1" = "status" ]; then
  if [ -e /tmp/myun2.shibuya.unicorn.pid ]; then
    ps -ef | grep `cat /tmp/myun2.shibuya.unicorn.pid`
  else
    echo "Unicorn process has not running."
  fi

elif [ "$1" = "restart" ]; then
  if [ -e /tmp/myun2.shibuya.unicorn.pid ]; then
    echo "Restart Unicorn"
    kill -HUP `cat /tmp/myun2.shibuya.unicorn.pid`
  else
    echo "Unicorn process has not started."
  fi

elif [ "$1" = "stop" ]; then
  if [ -e /tmp/myun2.shibuya.unicorn.pid ]; then
    echo "Stopped Unicorn"
    kill -QUIT `cat /tmp/myun2.shibuya.unicorn.pid`
  else
    echo "Unicorn process has not started."
  fi

else
  echo "usage: ./unicorn.sh [start|status|stop|restart]"
fi
