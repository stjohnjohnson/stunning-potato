#!/usr/bin/env bash

# ~/.macos — https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
pinfo "General UI/UX"
###############################################################################

pnotice "Set computer name (as done via System Preferences → Sharing)"
sudo scutil --set ComputerName "infinite-improbability"
sudo scutil --set HostName "infinite-improbability"
sudo scutil --set LocalHostName "infinite-improbability"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "infinite-improbability"

pnotice "Set standby delay to 24 hours (default is 1 hour)"
sudo pmset -a standbydelay 86400

pnotice "Disable the sound effects on boot"
sudo nvram SystemAudioVolume=" "

pnotice "Disable transparency in the menu bar and elsewhere on Yosemite"
defaults write com.apple.universalaccess reduceTransparency -bool true

# pnotice "Set highlight color to green"
# defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

pnotice "Set sidebar icon size to medium"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

pnotice "Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

pnotice "Disable the over-the-top focus ring animation"
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

pnotice "Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

pnotice "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

pnotice "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

pnotice "Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

pnotice "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

pnotice "Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

pnotice "Remove duplicates in the 'Open With' menu (also see 'lscleanup' alias)"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

pnotice "Display ASCII control characters using caret notation in standard text views"
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

pnotice "Disable Resume system-wide"
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

pnotice "Disable automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

pnotice "Disable the crash reporter"
defaults write com.apple.CrashReporter DialogType -string "none"

pnotice "Set Help Viewer windows to non-floating mode"
defaults write com.apple.helpviewer DevMode -bool true

pnotice "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

pnotice "Restart automatically if the computer freezes"
sudo systemsetup -setrestartfreeze on

pnotice "Never go into computer sleep mode"
sudo systemsetup -setcomputersleep Off > /dev/null

pnotice "Disable Notification Center and remove the menu bar icon"
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

pnotice "Disable automatic capitalization as it’s annoying when typing code"
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

pnotice "Disable smart dashes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

pnotice "Disable automatic period substitution as it’s annoying when typing code"
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

pnotice "Disable smart quotes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

pnotice "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# pnotice "Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and"
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#rm -rf ~/Library/Application Support/Dock/desktoppicture.db
#sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
#sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg

###############################################################################
pinfo "SSD-specific tweaks"
###############################################################################

pnotice "Disable hibernation (speeds up entering sleep mode)"
sudo pmset -a hibernatemode 0

###############################################################################
pinfo "Trackpad, mouse, keyboard, Bluetooth accessories, and input"
###############################################################################

pnotice "Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

pnotice "Trackpad: map bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

pnotice "Disable “natural” (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

pnotice "Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

pnotice "Enable full keyboard access for all controls"
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

pnotice "Use scroll gesture with the Ctrl (^) modifier key to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
pnotice "Follow the keyboard focus while zoomed in"
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

pnotice "Disable press-and-hold for keys in favor of key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

pnotice "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

pnotice "Set language and text formats"
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

pnotice "Set the timezone; see 'sudo systemsetup -listtimezones' for other values"
sudo systemsetup -settimezone "America/Los_Angeles" > /dev/null

###############################################################################
pinfo "Screen"
###############################################################################

pnotice "Save screenshots to the Dropbox"
defaults write com.apple.screencapture location -string "${HOME}/Dropbox/Photos/Screenshots"

pnotice "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png"

pnotice "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

pnotice "Enable subpixel font rendering on non-Apple LCDs"
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

pnotice "Enable HiDPI display modes (requires restart)"
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
pinfo "Finder"
###############################################################################

pnotice "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
# defaults write com.apple.finder QuitMenuItem -bool true

pnotice "Finder: disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true

pnotice "Set Desktop as the default location for new Finder windows"
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

pnotice "Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

pnotice "Finder: show hidden files by default"
#defaults write com.apple.finder AppleShowAllFiles -bool true

pnotice "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

pnotice "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

pnotice "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

pnotice "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

pnotice "Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

pnotice "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

pnotice "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

pnotice "Enable spring loading for directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

pnotice "Remove the spring loading delay for directories"
defaults write NSGlobalDomain com.apple.springing.delay -float 0

pnotice "Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

pnotice "Disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

pnotice "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

pnotice "Show item info near icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

pnotice "Show item info to the right of the icons on the desktop"
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

pnotice "Enable snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

pnotice "Increase grid spacing for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

pnotice "Increase the size of icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

pnotice "Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

pnotice "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

pnotice "Enable AirDrop over Ethernet and on unsupported Macs running Lion"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

pnotice "Show the ~/Library folder"
chflags nohidden ~/Library

pnotice "Show the /Volumes folder"
sudo chflags nohidden /Volumes

pnotice "Remove Dropbox’s green checkmark icons in Finder"
file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
[ -e "${file}" ] && mv -f "${file}" "${file}.bak"

pnotice "Expand the following File Info panes"
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

###############################################################################
pinfo "Dock, Dashboard, and hot corners"
###############################################################################

pnotice "Enable highlight hover effect for the grid view of a stack (Dock)"
defaults write com.apple.dock mouse-over-hilite-stack -bool true

pnotice "Set the icon size of Dock items to 36 pixels"
defaults write com.apple.dock tilesize -int 36

pnotice "Change minimize/maximize window effect"
defaults write com.apple.dock mineffect -string "scale"

pnotice "Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true

pnotice "Enable spring loading for all Dock items"
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

pnotice "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

pnotice "Wipe all (default) app icons from the Dock"
defaults write com.apple.dock persistent-apps -array

pnotice "Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

pnotice "Speed up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.1

pnotice "Don’t group windows by application in Mission Control"
defaults write com.apple.dock expose-group-by-app -bool false

pnotice "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

pnotice "Don’t show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true

pnotice "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

pnotice "Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0

pnotice "Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0

pnotice "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

pnotice "Make Dock icons of hidden applications translucent"
defaults write com.apple.dock showhidden -bool true

pnotice "Disable the Launchpad gesture (pinch with thumb and three fingers)"
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

pnotice "Reset Launchpad, but keep the desktop wallpaper intact"
find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

pnotice "Add iOS & Watch Simulator to Launchpad"
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"

# Add a spacer to the left side of the Dock (where the applications are)
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
#defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
pnotice "Top left screen corner → Mission Control"
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 0
pnotice "Top right screen corner → Desktop"
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0
pnotice "Bottom left screen corner → Start screen saver"
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0
pnotice "Bottom right screen corner → Start screen saver"
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

###############################################################################
pinfo "Spotlight"
###############################################################################

# pnotice "Hide Spotlight tray-icon (and subsequent helper)"
# sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
# Disable Spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"
# Change indexing order and disable some search results
# Yosemite-specific search results (remove them if you are using macOS 10.9 or older):
# 	MENU_DEFINITION
# 	MENU_CONVERSION
# 	MENU_EXPRESSION
# 	MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
# 	MENU_WEBSEARCH             (send search queries to Apple)
# 	MENU_OTHER
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

###############################################################################
pinfo "Terminal & iTerm 2"
###############################################################################

pnotice "Only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

pnotice "Enable Secure Keyboard Entry in Terminal.app"
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

pnotice "Disable the annoying line marks"
defaults write com.apple.Terminal ShowLineMarks -int 0

# pnotice "Install the Solarized Dark theme for iTerm"
# open "${HOME}/init/Solarized Dark.itermcolors"

pnotice "Don’t display the annoying prompt when quitting iTerm"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

###############################################################################
pinfo "Time Machine"
###############################################################################

pnotice "Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
pinfo "Activity Monitor"
###############################################################################

pnotice "Show the main window when launching Activity Monitor"
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

pnotice "Visualize CPU usage in the Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

pnotice "Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

pnotice "Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
pinfo "Address Book, Dashboard, iCal, TextEdit, and Disk Utility"
###############################################################################

pnotice "Enable the debug menu in Address Book"
defaults write com.apple.addressbook ABShowDebugMenu -bool true

pnotice "Enable Dashboard dev mode (allows keeping widgets on the desktop)"
defaults write com.apple.dashboard devmode -bool true

pnotice "Enable the debug menu in iCal (pre-10.8)"
defaults write com.apple.iCal IncludeDebugMenu -bool true

pnotice "Use plain text mode for new TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0
pnotice "Open and save files as UTF-8 in TextEdit"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

pnotice "Enable the debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

pnotice "No Auto-play videos when opened with QuickTime Player"
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool false

###############################################################################
pinfo "Mac App Store"
###############################################################################

pnotice "Enable the WebKit Developer Tools in the Mac App Store"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

pnotice "Enable Debug Menu in the Mac App Store"
defaults write com.apple.appstore ShowDebugMenu -bool true

pnotice "Enable the automatic update check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

pnotice "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

pnotice "Download newly available updates in background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

pnotice "Install System data files & security updates"
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

pnotice "Automatically download apps purchased on other Macs"
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

pnotice "Turn on app auto-update"
defaults write com.apple.commerce AutoUpdate -bool true

pnotice "Allow the App Store to reboot machine on macOS updates"
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

###############################################################################
pinfo "Photos"
###############################################################################

pnotice "Prevent Photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
pinfo "Messages"
###############################################################################

pnotice "Disable automatic emoji substitution (i.e. use plain text smileys)"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

pnotice "Disable smart quotes as it’s annoying for messages that contain code"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

pnotice "Disable continuous spell checking"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

###############################################################################
pinfo "Google Chrome & Google Chrome Canary"
###############################################################################

pnotice "Disable the all too sensitive backswipe on trackpads"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

pnotice "Disable the all too sensitive backswipe on Magic Mouse"
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false

pnotice "Use the system-native print preview dialog"
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

pnotice "Expand the print dialog by default"
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true
