@TradingViewUI = flight.component(->
  @after 'initialize', ->
    default_options =
      autosize: true
      symbol: gon.market.id
      interval: '60'
      container_id: 'tv_chart_container'
      datafeed: new (Datafeeds.UDFCompatibleDatafeed)('/api/v2/tv')
      library_path: '/assets/charting_library/'
#      custom_css_url: '/tv_custom.css'
      locale: gon.local
      drawings_access:
        type: 'black'
        tools: [ { name: 'Regression Trend' } ]
      toolbar_bg: '#171D27'
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
        'paneProperties.background': '#171D27'
        'paneProperties.vertGridProperties.color': '#171D27'
        'paneProperties.horzGridProperties.color': '#171D27'
        'symbolWatermarkProperties.transparency': 90
        'scalesProperties.showLeftScale': false
        'scalesProperties.showRightScale': true
        'scalesProperties.backgroundColor': '#ffffff'
        'scalesProperties.lineColor': '#282C36'
        'scalesProperties.textColor': '#c5c5c5'
        'scalesProperties.scaleSeriesOnly': false
        'mainSeriesProperties.lineStyle.color': '#008E7D'
        'mainSeriesProperties.lineStyle.linewidth': 2
        'mainSeriesProperties.areaStyle.linewidth': 2
      favorites: intervals: [
        '1'
        '5'
        '15'
        '60'
        '1D'
      ]
    options = $.extend(default_options, @attr.options or {})
    widget = window.tvWidget = new (TradingView.widget)(options)
    if @attr.onReady
      onReady = @attr.onReady
      widget.onChartReady ->
        onReady()
        return
    return
)
