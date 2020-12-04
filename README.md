
# react-native-yztfaceliveness

## Getting started

`$ npm install react-native-yztfaceliveness --save`

### Mostly automatic installation

`$ react-native link react-native-yztfaceliveness`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-yztfaceliveness` and add `RNYztfaceliveness.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNYztfaceliveness.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.yztfaceliveness.RNYztfacelivenessPackage;` to the imports at the top of the file
  - Add `new RNYztfacelivenessPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-yztfaceliveness'
  	project(':react-native-yztfaceliveness').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-yztfaceliveness/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-yztfaceliveness')
  	```


## Usage
```javascript
import RNYztfaceliveness from 'react-native-yztfaceliveness';

// TODO: What to do with the module?
RNYztfaceliveness;
```
  