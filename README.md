# How To Get Started
To make any of Applitools SDKs (**EyesXCUI**, **EyesImages**) work, you should install it using Swift Package Manager, or manually.

<br>


# Swift Package Manager

1. In Xcode, select "File" -> "Add Packages..."
2. Enter the URL:
##### EyesXCUI
```bash
https://github.com/applitools/eyes-xcui-swift-package.git
```

##### EyesImages
```bash
https://github.com/applitools/eyes-images-swift-package.git
```
3. Click "Add Package"
4. In the "Target" column, select your UI Tests target for **EyesXCUI**, or select your Unit Tests target for **EyesImages**.
5. Click "Add Package".

<br>


# Manual installation
1. Drag-and-drop EyesXCUI.framework to UI test target.

2. Open project navigator, select UI tests target(where you want to work with EyesXCUI SDK). Select **Build Phases** section.

3. Select **Copy Files** phase(or create if it does not exist by tapping **+** button on the top left corner of Project Navigator).

4. Tap **+** button on **Copy Files** phase, find and add EyesXCUI.framework.

5. Change **Destination** value to *Frameworks* on **Copy Files** phase.
