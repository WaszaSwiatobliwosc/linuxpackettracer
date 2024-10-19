# Foreword
Welcome!</br>
In the times long gone Cisco has been releasing It's Packet Tracer utility for various platforms e.g. Windows, MacOS, .deb based, .rpm based and Arch based GNU/Linux distributions. The  release tree was cut short except first three OS' mentioned earlier.  This installer returns the mint-fresh version to the Linux desktops. 

# Before We begin
<li>Head to the https://www.netacad.com/resources/lab-downloads and download "Packet Tracer 8.2.2 Ubuntu 64bit". 
Save it in default Downloads folder because script starts executing there.</li>
<li> If for any reason Cisco resource is unavailable, You can download it here:</br>
https://mega.nz/file/QkhBxS4C#bsHpAKjp16Dw4tivGACoTGc03niuK38_nIUvkLH0yGY </li>
<li>Git tools:</li>
OpenSUSE Leap/Tumbleweed
<code>zypper in git</code></br>
Fedora/CentOS
<code>dnf install git</code></br>
Debian/Mint/Ubuntu
<code>apt-get install git</code></br>
Arch
<code>pacman -s git</code></br>
</br>
If any of this returns error, add <code>sudo</code> at the start.

# Install
<li>Open terminal (ctrl + alt + t) and enter Your Downloads/ directory.</li>
<li>Clone this repo or download .zip and extract it there. Enter it and run <code>./install.sh</code>. Let the magic do the trick.</li></br>
When installation is complete Packet Tracer should be accesible from Application menu, Ulauncher and Desktop.
</br>Command <code>packettracer</code> can be run in Terminal. You can run <code>packettracer --no-sanbox</code> too.</br> 
</br>Have You encountered any errors head back to <b>Before We begin</b> or <b>Known issues</b> chapter.

# Known issues
<li>Arch Linux XFCE despite having xdg-utlis package was lacking xdg-user-dirs. It could've been bypassed by modifying the installation script and setting DOWNLOADS_DIR as ~/Downloads or wherever the .deb file's been saved, though I wanted to keep this installer as user-friendly as it could get.</li> 
<li>Arch Linux XFCE lacks full qt5. You have to install it first by running sudo pacman -S qt5 and selecting all (I haven't figured out which one exactly solved the issue).</li>
</br>Feel free to report bugs. 
