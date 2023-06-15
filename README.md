# pixelbook-battery-stats
Battery firmware scraper script for Pixelbooks with a faulty EC battery connection

<b>HOW TO USE:</b>
<p>Open crosh via CTRL + ALT + T, enter shell mode (type and enter <code>shell</code> from the crosh terminal), copy the script to /usr/local/bin, and run it by typing its name via the crosh shell. The script provides values for current % charged, current battery health, and battery cycles.</p>


<b>BACKGROUND:</b>

<p>This script came about when I changed a Pixelbook battery and likely shorted out the embedded controller (EC) connection while doing so; my understanding is that this is a common risk and issue when replacing batteries on these models.</p>
<p>While the battery seems completely unrecognized by any GUI elements (like a shelf notification) or common ChromeOS shell (crosh) commands like battery_test, battery stats can still be retrieved by at least one commands via crosh. You can do this by logging into crosh by using CTL + ALT + T, typing shell (provided you're in developer mode, which you must be if you've disabled write-protection), and then typing <code>sudo ectool battery</code> into the terminal. The values returned include OEM name, model number, chemistry(!), serial number, design capacity, last full charge, design output voltage, cycle count, present voltage, present current, remaining capacity, and flags.</p>
<p>The purpose of this script is to pull values from this output and format them into more meaningful notes about battery charge and life as the indicator would with a working battery EC connection. The script returns the current percentage of battery remaining (remaining capacity/last full charge), battery health (last full charge/design capacity) and battery cycles.</p>
<p>Unfortunately, the script requires quite a bit of interaction right now to run. You must open crosh (CTRL + ALT + T), type and enter <code>shell</code>, and then run the script as a binary. To further complicate matters, you must copy the script to your /usr/local/bin directory in order to run it from the crosh shell as <a href=https://chromium.googlesource.com/chromiumos/docs/+/master/security/noexec_shell_scripts.md>most of the directories and file systems via crosh as otherwise locked down for security purposes.</a></p>
<b>WHAT'S NEXT:</b>
<p></p>
<li>Run the script at timed intervals (via cron?)</li>
<li>Output to a more convenient location</li>
<li>Ideally, make values available somewhere highly/easily visible, such as on the desktop</li>
