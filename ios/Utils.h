//
//  Utils.h
//  GeekTeacherApp
//
//  Created by 甘瑞文 on 2019/9/20.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

+ (NSMutableDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+ (BOOL)isIPhoneXSeries;

+ (NSString *)saveImageTosandBox:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
