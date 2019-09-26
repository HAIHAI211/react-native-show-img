
# react-native-show-img

## Getting started

`$ npm install react-native-show-img --save`

### Mostly automatic installation

`$ react-native link react-native-show-img`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-show-img` and add `RNShowImg.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNShowImg.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.harrison.showimg.RNShowImgPackage;` to the imports at the top of the file
  - Add `new RNShowImgPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-show-img'
  	project(':react-native-show-img').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-show-img/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-show-img')
  	```


## Usage
```javascript
import RNShowImg from 'react-native-show-img';

// TODO: What to do with the module?
RNShowImg;
```
  