## How To Get Started
To make any of Applitools SDKs(**EyesXCUI** and **EyesImages**) work, you should install it using Swift Package Manager, [CocoaPods](http://cocoapods.org), or manually.


## Installation with Swift Package Manager

##### EyesXCUI
In Xcode, select File > Add Packages... then add the GitHub URL of `EyesXCUI`:
```bash
https://github.com/applitools/eyes-xcui-swift-package.git
```
Click 'Add Package', then in the Target column select your UI Tests target, then click 'Add Package'.

##### EyesImages
In Xcode, select File > Add Packages... then add the GitHub URL of `EyesImages`:
```bash
https://github.com/applitools/eyes-images-swift-package.git
```
Click 'Add Package', then in the Target column select your Unit Tests target, then click 'Add Package'.


## Installation with CocoaPods
### Step 1: Install gem
CocoaPods is distributed as a ruby gem, and is installed by running the following commands in terminal:
```bash
$ gem install cocoapods
```

### Step 2: Create a Podfile
Open a terminal window, and $ cd into your project directory. Then, run the following command:

```bash
$ pod init
```

### Step 3: Edit the Podfile
Specify it in your `Podfile`:
##### EyesXCUI
```ruby
target 'APPLICATION_TARGET_NAME' do
  target 'UI_TESTING_TARGET_NAME' do
    pod 'EyesXCUI'
  end
end
```
##### EyesImages
```ruby
target 'APPLICATION_TARGET_NAME' do
  target 'UNIT_TESTING_TARGET_NAME' do
  pod 'EyesImages'
  end
end
```

Save your `Podfile`.

### Step 4: Install dependencies
Run the following command in the terminal window:
```bash
$ pod install
```

Close Xcode, and then open your project's `.xcworkspace` file to launch Xcode.
From this time onwards, you must use the `.xcworkspace` file to open the project.


## Manual installation
1. Drag-and-drop EyesXCUI.framework to UI test target.
![](https://applitools.bintray.com/Examples/Manual%20Installation%20Guide%20Images/Step1-1.png)
![](https://applitools.bintray.com/Examples/Manual%20Installation%20Guide%20Images/Step1-2.png)

2. Open project navigator, select UI tests target(where you want to work with EyesXCUI SDK). Select **Build Phases** section.
![](https://applitools.bintray.com/Examples/Manual%20Installation%20Guide%20Images/Step2.png)

3. Select **Copy Files** phase(or create if it does not exist by tapping **+** button on the top left corner of Project Navigator).
![](https://applitools.bintray.com/Examples/Manual%20Installation%20Guide%20Images/Step3-1.png)
![](https://applitools.bintray.com/Examples/Manual%20Installation%20Guide%20Images/Step3-2.png)

4. Tap **+** button on **Copy Files** phase, find and add EyesXCUI.framework.
![](https://applitools.bintray.com/Examples/Manual%20Installation%20Guide%20Images/Step4-1.png)
![](https://applitools.bintray.com/Examples/Manual%20Installation%20Guide%20Images/Step4-2.png)

5. Change **Destination** value to *Frameworks* on **Copy Files** phase.
![](https://applitools.bintray.com/Examples/Manual%20Installation%20Guide%20Images/Step5.png)
