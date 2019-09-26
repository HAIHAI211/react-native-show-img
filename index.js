
import { NativeModules, Platform } from 'react-native';

// const { RNShowImg } = NativeModules;

// const params = {
//     index: 0,
//     images: [
//         {
//             origImage: '',
//             editedImage: ''
//         }
//     ]
// }

const show = (params) => {
    const stringParams = JSON.stringify(params)
    if (Platform.OS === 'ios') {
        NativeModules.RNShowImg.show(stringParams)
    } else if (Platform.OS === 'android') {
        NativeModules.PicEditModule.edit(stringParams)
    }
}

export default show
