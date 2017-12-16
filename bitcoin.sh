#!/bin/sh

getbtc(){
btc=$(curl -s 'http://realtimebitcoin.info/stats')

buy=$(echo $btc|jq '.ticker|.USD|.buy')
sell=$(echo $btc|jq '.ticker|.USD|.sell')
avg=$(echo $btc|jq '.ticker|.USD|.avg')

notify-send 'Bitcoin:' "Buy: $buy\nSell: $sell\nAvg: $avg"
}

getltc(){
ltc=$(curl -s 'https://api.coinbase.com/v2/prices/USD/spot?')
ltc_price=$(echo $ltc|jq '.data[2]|.amount')
ltc_real_price=$(echo $ltc_price | sed 's/"//g')
notify-send 'Litcoin:' "Price: $ltc_real_price"
}
while true
do
  getbtc
  getltc
  sleep 300
done
