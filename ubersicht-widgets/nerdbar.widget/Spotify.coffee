command: "sh nerdbar.widget/scripts/spotify.sh"

refreshFrequency: 2000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="./colors.css" />
  """

style: """
  text-align: center
  top: 4px
  color: #ffffff
  height: 13
  width: 100%
"""

render: (output) -> """
 <span class='white'>#{output}</span>
"""
