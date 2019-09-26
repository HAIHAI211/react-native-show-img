//
//  Utils.m
//  GeekTeacherApp
//
//  Created by 甘瑞文 on 2019/9/20.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSMutableDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
  if(jsonString ==nil) {
    return nil;
  }
  NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
  NSError *err;
  NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                             options:NSJSONReadingMutableContainers
                                                               error:&err];
  if(err) {
    NSLog(@"json解析失败：%@",err);
    return nil;
  }
  return dic;
}

+ (BOOL)isIPhoneXSeries {
  BOOL iPhoneXSeries = NO;
  if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
    return iPhoneXSeries;
  }
  
  if (@available(iOS 11.0, *)) {
    UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
    if (mainWindow.safeAreaInsets.bottom > 0.0) {
      iPhoneXSeries = YES;
    }
  }
  return iPhoneXSeries;
}

+ (NSString *)saveImageTosandBox:(UIImage *)image {
  NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
  NSString *filePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:
                        [NSString stringWithFormat:@"%@.png",  [[NSUUID UUID] UUIDString]]];  // 保存文件的名称
  
  BOOL result =[UIImagePNGRepresentation(image)writeToFile:filePath   atomically:YES]; // 保存成功会返回YES
  if (result == YES) {
    NSLog(@"保存成功");
    return filePath;
    
  }
  return @"";
}

@end
