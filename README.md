# pixelbook-battery-stats
Battery firmware scraper and notifier script for Pixelbooks with a faulty EC battery connection

<b>HOW TO USE:</b>
<p>Open crosh via CTRL + ALT + T, enter shell mode (type and enter <code>shell</code> from the crosh terminal), copy the scripts to /usr/local/bin, and run it by typing its name via the crosh shell. Optionally, add the script to <code>~/.bashrc</code>. The script provides notifications for battery's current % charged.</p>


<b>BACKGROUND:</b>

<p>This script came about when I <a href=https://www.ifixit.com/Guide/Google+Pixelbook+Battery+(Back+Panel)+Replacement/103036>changed a Pixelbook battery</a> and likely shorted out the embedded controller (EC) connection while doing so; my understanding is that this is a common risk and issue when replacing batteries on these models.</p>
<p>While the battery seems completely unrecognized by any GUI elements (like a shelf notification) or common ChromeOS shell (crosh) commands like battery_test, battery stats can still be retrieved by at least one commands via crosh. You can do this by logging into crosh by using CTL + ALT + T, typing shell (provided you're in <a href=https://mrchromebox.tech/#devmode>developer mode</a>, which you already must be if you've <a href=https://wiki.mrchromebox.tech/Firmware_Write_Protect>disabled write-protection</a> and <a href=https://mrchromebox.tech/#fwscript>flashed Mr. Chromebox's RW_LEGACY firmware</a>), and then typing <code>sudo ectool battery</code> into the terminal. The values returned include OEM name, model number, chemistry(!), serial number, design capacity, last full charge, design output voltage, cycle count, present voltage, present current, remaining capacity, and flags.</p>
<p>This script requires a bit of upfront setup and meddling, but it can now work in the background on a set interval (provided you leave the crosh sessions window open). To begin using, open crosh (CTRL + ALT + T), type and enter <code>shell</code>. To further complicate matters, you must copy the scripts to your /usr/local/bin directory in order to run it from the crosh shell as <a href=https://chromium.googlesource.com/chromiumos/docs/+/master/security/noexec_shell_scripts.md>most of the directories and file systems via crosh as otherwise locked down for security purposes.</a> Finally, add this code to the bottom of your <code>~/.basrc</code> (just under the <code>#Put your fun stuff here line</code>)in order to automatically run the script whenever you start crosh:
  <code>sh /usr/local/bin/battery_loop.sh &</code>
<b>WHAT'S NEXT:</b>
<p></p>
<li>Consolidate code into a single script?</li>
<li>Run the script without needing a persistently open crosh window</li>
<li>Customize the notification with a graphic depicting battery charge level?</li>
