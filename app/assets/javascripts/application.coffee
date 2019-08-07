#= require es5-shim.min
#= require es5-sham.min

#= require jquery
#= require jquery_ujs
#= require jquery.mousewheel
#= require jquery-timing.min
#= require jquery.nicescroll.min
#
#= require bootstrap
#= require bootstrap-switch.min
#
#= require moment
#= require bignumber
#= require underscore
#= require cookies.min
#= require flight.min
#= require pusher.min

#= require ./lib/sfx
#= require ./lib/notifier
#= require ./lib/pusher_connection

#= require highstock
#= require_tree ./highcharts/

#= require_tree ./helpers
#= require_tree ./component_mixin
#= require_tree ./component_data
#= require_tree ./component_ui
#= require_tree ./templates

#= require charting_library/charting_library.min
#= require charting_library/datafeed/udf/datafeed

#= require_self

TV_OPTIONS =
  container_id: 'tv_chart_container'
#  custom_css_url: '/tv_custom.css'
  toolbar_bg: '#071436'
  disabled_features: [
    'symbol_search_hot_key'
    'header_symbol_search'
    'header_interval_dialog_button'
    'show_interval_dialog_on_key_press'
    'header_compare'
    'header_undo_redo'
    'use_localstorage_for_settings'
  ]
  overrides:
    'volumePaneSize': 'tiny'
    'paneProperties.background': '#071436'
    'paneProperties.vertGridProperties.color': '#071436'
    'paneProperties.horzGridProperties.color': '#110e2f'
    'symbolWatermarkProperties.transparency': 90
    'scalesProperties.showLeftScale': false
    'scalesProperties.showRightScale': true
    'scalesProperties.backgroundColor': '#ffffff'
    'scalesProperties.lineColor': '#282C36'
    'scalesProperties.textColor': '#c5c5c5'
    'scalesProperties.scaleSeriesOnly': false
    'mainSeriesProperties.candleStyle.upColor': '#4ecdc4'
    'mainSeriesProperties.candleStyle.downColor': '#ff6b6b'
    'mainSeriesProperties.candleStyle.drawWick': true
    'mainSeriesProperties.candleStyle.drawBorder': true
    'mainSeriesProperties.candleStyle.borderColor': '#378658'
    'mainSeriesProperties.candleStyle.borderUpColor': '#4ecdc4'
    'mainSeriesProperties.candleStyle.borderDownColor': '#ff6b6b'
    'mainSeriesProperties.candleStyle.wickUpColor': '#4ecdc4'
    'mainSeriesProperties.candleStyle.wickDownColor': '#ff6b6b'
    'mainSeriesProperties.candleStyle.barColorsOnPrevClose': false
    'mainSeriesProperties.lineStyle.color': '#008E7D'
    'mainSeriesProperties.lineStyle.linewidth': 2
    'mainSeriesProperties.areaStyle.linewidth': 2
  studies_overrides:
    'volume.volume.color.0': '#4ecdc4'
    'volume.volume.color.1': '#ff6b6b'
    'volume.volume.transparency': 90
  favorites: intervals: [
    '1'
    '5'
    '15'
    '60'
    '1D'
  ]

$ ->
  window.notifier = new Notifier()

  BigNumber.config(ERRORS: false)

  HeaderUI.attachTo('header')
  AccountSummaryUI.attachTo('#account_summary')

  FloatUI.attachTo('.float')
  KeyBindUI.attachTo(document)
  AutoWindowUI.attachTo(window)

  PlaceOrderUI.attachTo('#bid_entry')
  PlaceOrderUI.attachTo('#ask_entry')
  OrderBookUI.attachTo('#order_book')
  DepthUI.attachTo('#depths_wrapper')

  MyOrdersUI.attachTo('#my_orders')
  MarketTickerUI.attachTo('#ticker')
  MarketSwitchUI.attachTo('#market_list_wrapper')
  MarketTradesUI.attachTo('#market_trades_wrapper')

  MarketData.attachTo(document)
  GlobalData.attachTo(document, {pusher: window.pusher})
  MemberData.attachTo(document, {pusher: window.pusher}) if gon.accounts

#  CandlestickUI.attachTo('#candlestick')
  SwitchUI.attachTo('#range_switch, #indicator_switch, #main_indicator_switch, #type_switch')

  TradingViewUI.attachTo '#candlestick', options: TV_OPTIONS

  $('.panel-body-content').niceScroll
    autohidemode: true
    cursorborder: "none"
