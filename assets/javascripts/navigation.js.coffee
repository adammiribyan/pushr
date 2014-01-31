jQuery ->
  Pushr.setup()

Pushr =
  setup: ->
    @bindActions()

  bindActions: ->
    $("a.js-nav").on "click", (e) -> Pushr.navigate(e)

    $(window).on "statechange", @onStateChange

    $(document).on "uiNavigate", @navigateUsingPushState
    $(document).on "uiPageChanged", @setTitle
    $(document).on "dataPageRefresh", @updatePage

  onStateChange: (e) ->
   state = History.getState()
   $(document).trigger("uiNavigate", [{ href: state.data.url }]) if state

  navigate: (e) ->
    if (e.shiftKey or e.ctrlKey or e.metaKey or (e.which != undefined and e.which > 1)) then return

    $link = $(e.target)
    if $link.length and not e.isDefaultPrevented()
      e.preventDefault()
      $link.trigger("uiNavigate", [{ href: $link.attr("href") }])

  navigateUsingPushState: (e, data) ->
    $.ajax(
      url: data.href,
      dataType: "json",
      type: "GET",
      success: (response) ->
        History.pushState(response, response.title, response.url)
        $(document).trigger("dataPageRefresh", [response])
    )

  updatePage: (e, data) ->
    $(data.container).html(data.content)
    # Do some other stuff...
    $(document).trigger("uiPageChanged", [data])

  setTitle: (e, data) ->
    state = data.state
    document.title = state.title if state
