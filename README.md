## My Mac Setup

This repo contains info on all the apps / tools / settings I use on my Mac.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [What Macbook do I have?](#what-macbook-do-i-have)
- [Homebrew / Terminal / Shell](#homebrew--terminal--shell)
  - [Homebrew](#homebrew)
  - [Terminal](#terminal)
  - [Shell](#shell)
    - [Install Bash and set it as the default](#install-bash-and-set-it-as-the-default)
    - [Customizing Bash with `.bash_profile`](#customizing-bash-with-bash_profile)
    - [Commands used by my .bash_profile](#commands-used-by-my-bash_profile)
    - [Install the latest version of git](#install-the-latest-version-of-git)
    - [Other command line tools I use](#other-command-line-tools-i-use)
- [OS Productivity](#os-productivity)
  - [Window Management](#window-management)
  - [App Switching](#app-switching)
  - [Quick Launching](#quick-launching)
- [Other Apps I Use Daily](#other-apps-i-use-daily)
- [OS Settings](#os-settings)
  - [Finder](#finder)
  - [Dock](#dock)
- [Menu Bar Customization](#menu-bar-customization)
  - [System Stats Widgets](#system-stats-widgets)
  - [Menu Bar Calendar](#menu-bar-calendar)
- [Note Taking](#note-taking)
- [Web Browser](#web-browser)
  - [Firefox](#firefox)
- [Node.js](#nodejs)
  - [Global Modules](#global-modules)
- [VS Code](#vs-code)
- [Break Timer](#break-timer)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## What Macbook do I have?

In the 2022 setup video I was using the 2015 Macbook Pro. You can read more about it [here](https://everymac.com/systems/apple/macbook_pro/specs/macbook-pro-core-i7-2.5-15-dual-graphics-mid-2015-retina-display-specs.html)

I am now using the 2021 14" Macbook Pro. This setup works exactly the same on there.

These are the specs at a glance:
* Apple M1 Pro
* 16GB RAM
* 500GB SSD

Read more about this Macbook [here](https://everymac.com/systems/apple/macbook_pro/specs/macbook-pro-m1-pro-8-core-cpu-14-core-gpu-14-2021-specs.html)

## Homebrew / Terminal / Shell

### Homebrew

[Homebrew](https://brew.sh/) allows us to install tools and apps from the command line.

To install it, open up the built in `Terminal` app and run this command:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

This will also install the xcode build tools which is needed by many other developer tools.

After Homebrew is done installing, we will use it to install everything else we need.

### Terminal

The first app I install is to replace the built in `Terminal`.

I prefer [iTerm2](https://iterm2.com/) because:
* Nice [window chrome](https://en.wiktionary.org/wiki/chrome#Noun)
* Lots of customization options
* Clickable links
* Native OS notifications

>Quick aside - "window chrome" is another term for the basic structural elements used in a graphical user interface, such as window frames and scroll bars, as opposed to the content. After having a few people review this, I realize not everyone knows / uses that term 😅

There are a lot of options for a terminal replacement, but I've been using iTerm2 for years and it works great for my needs.

Checkout their documentation for more info on what iTerm2 can do: [https://iterm2.com/documentation.html](https://iterm2.com/documentation.html)

We install this using a Homebrew "cask". Casks are full applications, similar to what you would install from the App store.

```
brew install iterm2
```

Once installed, launch it and customize the settings / preferences to your liking. These are my preferred settings:

* Appearance
  * Theme
    * Minimal
* Profiles
  * Default
      * General -> Working Directory -> Reuse previous session's directory
      * Colors -> Basic Colors -> Foreground -> Lime Green
      * Text -> Font -> Anonymous Pro
          * You can download this font [here](https://www.marksimonson.com/fonts/view/anonymous-pro).
          * I use this font in VS Code as well
      * Text -> Font Size -> 36
          * I use my Macbook to present / teach, so a big font size is important so everyone can see the commands I'm typing
      * Keys -> Key Mappings -> Presets -> Natural Text Editing
          * This allows me to use the [keyboard shortcuts](https://gist.github.com/w3cj/022081eda22081b82c52) I know and love inside of iTerm2

### Shell

Mac now comes with `zsh` as the default [shell](https://en.wikipedia.org/wiki/Comparison_of_command_shells). `bash` is my preferred shell.

I prefer bash because every remote linux machine I log into uses bash. Also, most shell scripts you come across (`.sh` files) are meant to be run on `sh` (Bourne shell) or `bash` (Bourne again shell). These files _might_ run on `zsh`, but there might be some compatibility issues.

If you are a beginner, you probably don't need to replace your shell with `bash`. If you're going to stick with `zsh`, checkout [Oh My Zsh](https://ohmyz.sh/) which gives you a bunch of customizations out of the box.

#### Install Bash and set it as the default

To see what shell is currently your default, run:

```sh
echo $SHELL
```

To install the latest version of bash:

```sh
brew install bash
```

Then, determine where bash got installed:

```sh
which bash
```

This will likely print `/usr/local/bin/bash`.

We now need to add this to our `/etc/shells` file so we can set it as our default shell.

Open up the `/etc/shells` file in `nano` (a command line text editor) with super user privileges (you will need to type your password after running this command):

```sh
sudo nano /etc/shells
```

Command explained:

* [`sudo`](https://en.wikipedia.org/wiki/Sudo) is a way of running a command with `super user` privileges.
* [`nano`](https://en.wikipedia.org/wiki/GNU_nano) is an easy to use command line editor. As opposed to [`vi` or `vim`](https://en.wikipedia.org/wiki/Vim_(text_editor)).
* `/etc/shells` is the file we need to edit / update.

This will launch a command line editor. Add `/usr/local/bin/bash` to the file above the other list of shells.

Press `CTRL+X` to close the file and then `Y` to confirm / save the changes.

Now that `/usr/local/bin/bash` is in our `/etc/shells` file, we can set it as our default shell (you will need to enter your password for this command as well):

```sh
chsh -s /usr/local/bin/bash
```

Now that you've changed your shell, if you open up a new iTerm2 tab or close / re-open iTerm2, you should be presented with a `bash` shell!

You can run the following to confirm you shell has changed:

```sh
echo $SHELL
```

#### Customizing Bash with `.bash_profile`

I have a custom `.bash_profile` with all of my custom settings including a customized prompt, aliases, PATH variables, colors and more.

If you do not want to go through the process of customizing your `.bash_profile`, you can install [Oh My Bash](https://ohmybash.nntoan.com/) to get a ton of customizations out of the box.

I store my `.bash_profile` on [github here](https://github.com/w3cj/dotfiles/blob/master/.bash_profile) so I can copy it over to any machine I'm setting up.

Copy this file (or create your own) in your home directory:

```sh
cd ~
curl -O https://raw.githubusercontent.com/w3cj/dotfiles/master/.bash_profile
```

#### Commands used by my .bash_profile

* vcprompt - list the current branch if in a folder that is a git repo
* [fortune](https://en.wikipedia.org/wiki/Fortune_(Unix)) - print a random quote / story / joke / poem.
* [cowsay](https://en.wikipedia.org/wiki/Cowsay) - use a cowfile to say a random fortune

```sh
brew install vcprompt
brew install fortune
brew install cowsay
```

#### Install the latest version of git

My Mac came with `git` version `2.32.1`, we can use brew to install the latest version of `git`:

```sh
git --version
brew install git
```

Open a new tab / window to start using the latest version:

```sh
git --version
```

Configure git with your name / email and preferred editor:

```sh
git config --global user.name w3cj

git config --global user.email cj@null.computer

git config --global core.editor nano
```

#### Other command line tools I use

* [ffmpeg](https://en.wikipedia.org/wiki/FFmpeg) - edit videos from the command line
* [imagemagick](https://en.wikipedia.org/wiki/ImageMagick) - edit images from the command line

```sh
brew install ffmpeg
brew install imagemagick
```

## OS Productivity

### Window Management

I know this feature is built in to a lot of other operating systems, but it is not built in to a Mac, so we need an app for it.

I use [rectangle](https://rectangleapp.com/) to move and resize windows using keyboard shortcuts. I used to use [spectacle](https://www.spectacleapp.com/), but rectangle is more regularly maintained and allows me to use all of the same keyboard shortcuts as spectacle.

I highly recommend installing this and memorizing the keyboard shortcuts. Fluid and seamless window management is key to being productive while coding.

```sh
brew install rectangle
```

### App Switching

The built in App switcher only shows application icons, and only shows 1 icon per app regardless of how many windows you have open in that app.

I use an app switcher called [AltTab](https://alt-tab-macos.netlify.app/). It shows full window previews, and has an option to show a preview for every open window in all applications (even minimized ones).

I replace the built-in `CMD+TAB` shortcut with AltTab.

```sh
brew install alt-tab
```

### Quick Launching

The built in spotlight search is a bit slow for me and usually has web search results as the default instead of apps or folders on my machine.

I use [Alfred](https://www.alfredapp.com/) to launch apps / folders. There are features locked behind the paid powerpack, but I purchased a lifetime license a few years ago, and Alfred keeps working great for me. There are a lot of other cool things you can do with Alfred (workflows, scripting, clipboard manager etc.), but I mainly use it for launching apps and folders.

```sh
brew install alfred
```

## Other Apps I Use Daily

* [firefox-developer-edition](https://www.mozilla.org/en-US/firefox/developer/) - Preferred web browser
* [app-cleaner](https://freemacsoft.net/appcleaner/) - When removing an app, will search your file system for related files / settings that should be removed as well
* android-file-transfer - Transfer files to / from my android phone
* android-platform-tools - Installs `adb` without the need for the full android studio.
* [keepingyouawake](https://keepingyouawake.app/) - Prevents my Mac from going to sleep when I'm presenting / live streaming
* [discord](https://discord.com/) - Messaging / Community
* [vlc](https://www.videolan.org/) - I use VLC to watch videos instead of the built in QuickTime.
* [keka](https://www.keka.io/en/) - Can extract 7z / rar and other types of archives
* [kap](https://getkap.co/) - Screen recorder / gif maker
* [time-out](https://www.dejal.com/timeout/) - Break timer
* [gimp](https://www.gimp.org/) - Image editor
* [inkscape](https://inkscape.org/) - Vector editor
* [visual-studio-code](https://code.visualstudio.com/) - Code Editor
* [sublime-text](https://www.sublimetext.com/) - Note taking (I know there are better apps...)
* [insomnia](https://insomnia.rest/products/insomnia) - HTTP / REST / GraphQL tester / requester

You can install them in one go by placing them all into a text file and then running brew install:

```
firefox-developer-edition
app-cleaner
android-file-transfer
android-platform-tools
keepingyouawake
discord
slack
vlc
keka
kap
time-out
gimp
inkscape
visual-studio-code
sublime-text
insomnia
```

```sh
xargs brew install < apps.txt
```

## OS Settings

These are my preferred settings for `Finder` and the `Dock`.

### Finder

* Finder -> Preferences
  * General -> Show these on the desktop -> Select None
      * I try to keep my desktop completely clean.
  * General -> New Finder windows show -> Home Folder
      * I prefer to see my home folder in each new finder window instead of recent documents
  * Advanced -> Show all filename extensions -> Yes
  * Advanced -> Show warning before changing an extension -> No
  * Advanced -> When performing a search -> Search the current folder
* View
  * Show Status Bar
  * Show Path Bar
  * Show Tab Bar

### Dock

I don't use the Dock at all. It takes up screen space, and I can use Alfred to launch apps and AltTab to switch between apps. I make the dock as small as possible and auto hide it.

* System Preferences
  * Dock & Menu Bar
      * Size -> Small as possible
      * Position on screen -> Right
      * Automatically hide and show the Dock -> Yes

## Menu Bar Customization

### System Stats Widgets

I like to see my network traffic, CPU temp / usage and RAM usage at a glance.

I used to use [iStat Menus](https://bjango.com/mac/istatmenus/), but a few people in my twitch chat pointed me to [stats](https://github.com/exelban/stats), a FOSS menu bar stats app. I tried it out, and I like it so far.

In each widget, a key setting to look for is under "widget settings", choose "merge widgets into one".

```sh
brew install stats
```

### Menu Bar Calendar

I like to have a calendar in the menu bar that I can quickly look at. stats does not include one, so I found [itsycal](https://www.mowglii.com/itsycal/). It seems fine for my needs.

```sh
brew install itsycal
```

itsycal shows the date, so I hide the date in the system menu bar widget:

* System Preferences
  * Dock & Menu Bar
      * Clock
          * Show Date -> Never
          * Show Day of Week -> No

## Note Taking

There are likely a million other better options, but I have used [Sublime Text](https://www.sublimetext.com/) as a note taking app for years now. I essentially use it as a staging area before moving my notes into a more permanent place (Google Docs, Google Keep, Trello, actual code project READMES etc.) or I delete the note (close the tab) after it has served its purpose.

I use sublime because it allows me to open new tabs / files without the need to save a given file. I can have several tabs / staging areas open and then completely close sublime. When I open it back up, all of my tabs are still there.

## Web Browser

### Firefox

I use Firefox because it is open source and comes from the [Mozilla Foundation](https://www.mozilla.org/en-US/about/manifesto/), a non profit company that [respects my privacy](https://www.mozilla.org/en-US/firefox/privacy/).

I use the following extensions to protect my privacy while browsing the web:

* Adblocker - [uBlock Origin](https://github.com/gorhill/uBlock)
* Tracker Blocker - [Privacy Badger](https://privacybadger.org/)
  * Firefox now includes tracker blocking, but I leave Privacy Badger enabled.
* [Cookie Autodelete](https://github.com/Cookie-AutoDelete/Cookie-AutoDelete)
  * Removes cookies from websites that are not in my whitelist whenever a tab is closed. An additional precaution to tracker blocking.
* [Decentraleyes](https://decentraleyes.org/)
  * Caches CDN links locally and intercepts requests to serve from the cache. Prevents CDNs from tracking you across websites.


## Node.js

I use nvm to manage the installed versions of Node.js on my machine. This allows me to easily switch between Node.js versions depending on the project I'm working in.

See installation instructions [here](https://github.com/nvm-sh/nvm#installing-and-updating).

OR run this command (make sure v0.39.1 is still the latest)

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

After installation you'll want to add the following to your .bash_profile / .zshrc etc.

```sh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" ## This loads nvm
```

Now that nvm is installed, you can install a specific version of node.js and use it:

```sh
nvm install 18
nvm use 18
node --version
```

### Global Modules

There are a few global node modules I use a lot:

* lite-server
  * Auto refreshing static file server. Great for working on static apps with no build tools.
* license
  * Auto generate open source license files
* gitignore
  * Auto generate `.gitignore` files base on the current project type

```
npm install -g lite-server license gitignore
```

## VS Code

VS Code is my preferred code editor.

You can view all of my VS Code settings / extensions [here](https://github.com/CodingGarden/vscode-settings).

2 of the most notable settings are:

```json
{
  "editor.linkedEditing": true,
  "editor.snippetSuggestions": "top",
}
```

* editor.linkedEditing
  * Automatically edit a closing tag when editing an opening tag
* editor.snippetSuggestions
  * Puts the most relevant auto complete options at the top

## Break Timer

I use an app called [Time Out](https://www.dejal.com/timeout/).

I have it setup to show:
* 10 second micro break every 15 minutes
* 5 minute long break every 60 minutes

There is also a cross platform break timer call [Stretchly](https://hovancik.net/stretchly/). I have not used it but a lot of people have recommended it.

