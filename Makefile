.PHONY: run
trade:
	freqtrade trade -c user_data/ojh/config_upbit.json --strategy BbandRsi --strategy-path user_data/ojh

.PHONY: backtesting
backtesting:
	freqtrade backtesting -c user_data/ojh/config_backtest.json -p '.*/KRW' --strategy-list BbandRsi -i 1h --dry-run-wallet 100000 --timerange 20241101-20241101

.PHONY: download-data
download-data:
	freqtrade download-data --exchange upbit --pairs '.*/KRW' -t 1m 5m 15m 30m 1h 1d --timerange=20241101-20241101
