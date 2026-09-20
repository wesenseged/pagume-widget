## Pagume Widget

This plasmoid displays the current date in Ethiopian Calendar.

![Pagume widget](/assets/widget.gif)

#### Installation

Method 1 - Install from file

Download the packaged widgets from the [Release page](https://github.com/wesenseged/pagume-widget/releases/latest) and load them manually:

1. Desktop -> Right Click -> Enter Edit Mode
2. Add Widget -> Get Widgets -> Install Widget From Local File
3. Select the downloaded .plasmoid file


Method 2 - Manual

``` bash

git clone https://github.com/wesenseged/pagume-widget.git
cd pagume-widget
kpackagetool6 --type Plasma/Applet --install pagume.date
```

Then:
- Right-click your desktop.
- Select Enter Edit Mode.
- Select Add Widgets.
- Search for Pagume.
- Add the widget.

#### Configuration

Pagume can be customized from the widget configuration:

- Day color
- Date color
- Ge'ez Number
- Font

#### Feature

- Change both day and date colors.
- Switch between Arabic and Amharic numbers.
- Switch between different fonts


#### Credits

- Inspiration Dark Hour plasmoid
- See [CREDITS.md](CREDITS.md) for third-party fonts


