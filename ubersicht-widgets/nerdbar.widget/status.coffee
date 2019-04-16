command: "sh nerdbar.widget/scripts/status.sh"

refreshFrequency: 10000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="./nerdbar.widget/colors.css" />
    <div class="compstatus"></div>
  """

style: """
  right: 8px
  top: 4px
  height: 13
  .wifi
    font: 14px 'Font Awesome 5 Free Regular'
    top: 1px
    position: relative
    left: 10px
  .charging
    font: 12px 'Font Awesome 5 Free Regular'
    position: relative
    top: 0px
    right: -12px
    z-index: 1
  """
netName: (netName) ->
  return "<span class='white'>#{netName}</span>";
timeAndDate: (date, time) ->
  # returns a formatted html string with the date and time
  return "<span class='white'>#{date} #{time}</span>";

batteryStatus: (battery, state) ->
  #returns a formatted html string current battery percentage, a representative icon and adds a lighting bolt if the
  # battery is plugged in and charging
  batnum = parseInt(battery)
  return "<span class='white'>#{batnum}%</span>"

update: (output, domEl) ->

  # split the output of the script
  values = output.split('@')

  time = values[0].replace /^\s+|\s+$/g, ""
  date = values[1]
  battery = values[2]
  isCharging = values[3]
  netStatus = values[4].replace /^\s+|\s+$/g, ""
  netName = values[5]
  netIP = values[6]

  # create an HTML string to be displayed by the widget
  htmlString =  @netName(netName, netStatus) + "<span> | </span>" + @batteryStatus(battery, isCharging) + "<span>" + " | " + "</span>" +
               @timeAndDate(date,time)

  $(domEl).find('.compstatus').html(htmlString)
