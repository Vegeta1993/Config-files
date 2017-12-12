#!/bin/sh

getJSON(){
json=$(curl -s 'http://realtimebitcoin.info/stats')

buy=$(echo $json|jq '.ticker|.USD|.buy')
sell=$(echo $json|jq '.ticker|.USD|.sell')
avg=$(echo $json|jq '.ticker|.USD|.avg')

notify-send 'Bitcoin:' "Buy: $buy\nSell: $sell\nAvg:$avg"
}

while true
do
  getJSON
  sleep 300
done
