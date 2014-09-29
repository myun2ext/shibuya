#/bin/sh

if [ "$1" = "start" ]; then
  unicorn -c unicorn.rb -E production -D

elif [ "$1" = "restart" ]; then
  kill -HUP `cat /tmp/myun2.shibuya.unicorn.pid`

elif [ "$1" = "restart" ]; then
  kill -HUP `cat /tmp/myun2.shibuya.unicorn.pid`
fi
