from i3pystatus import Status
from i3pystatus.weather import weathercom
from i3pystatus.mail import imap

status = Status()

# Calendar
status.register("clock",
        format=" %a,%-D  %X",
        on_leftclick="urxvt -hold -e cal -3")

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load",
        format="{avg1}",
        on_leftclick="urxvt -e htop")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="{temp:.0f}°C",)

status.register("battery",
    format="{status} {bar} {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=15,
    status={
        "DIS": "",
        "CHR": "",
        "FULL": "",
    },)

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
    interface="wlp2s0",
    format_up=" {essid} {quality:3.0f}%",
    on_leftclick="urxvt -e nmtui")

# Shows disk usage of /
status.register("disk",
    path="/",
    format=" {avail} GB",
    on_leftclick="pcmanfm")

# Shows pulseaudio default sink volume
# Note: requires libpulseaudio from PyPI

status.register("pulseaudio",
    format=" {volume}",
    step="1",)

status.register(
    'weather',
    format='{current_temp}{temp_unit} {icon}',
    interval=100,
    colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
        location_code='USNY0715',
        units='imperial',
        update_error='<span color="#ff0000">!</span>',),
)

status.register("mail",
    backends=[
        imap.IMAP(
             host="imap.gmail.com", port=993, ssl=True,
             username="andrewtramutolo@gmail.com",
             password="qrlipzyuswtuegtu"
            )],
            format=" {unread}",
            format_plural=" {unread}",
            on_leftclick="chromium 'https://inbox.google.com/'",)

status.register("bitcoin",
        )
status.run()
