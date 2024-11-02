### Setup
```
./setup.sh -i
```


### Freqtrade Upbit 사용 방법

```python
# example.py
 def _get_rate_from_ticker(
        self, side: EntryExit, ticker: Ticker, conf_strategy: dict[str, Any], price_side: BidAsk
    ) -> Optional[float]:
        """
        Get rate from ticker.
        """
        ticker_rate = ticker[price_side]
        #FIXED 업비트 지원
        if not ticker_rate:
            ticker_rate = float(ticker['info']['trade_price'])
        if ticker["last"] and ticker_rate:
            if side == "entry" and ticker_rate > ticker["last"]:
                balance = conf_strategy.get("price_last_balance", 0.0)
                ticker_rate = ticker_rate + balance * (ticker["last"] - ticker_rate)
            elif side == "exit" and ticker_rate < ticker["last"]:
                balance = conf_strategy.get("price_last_balance", 0.0)
                ticker_rate = ticker_rate - balance * (ticker_rate - ticker["last"])
        rate = ticker_rate
        return rate

```
