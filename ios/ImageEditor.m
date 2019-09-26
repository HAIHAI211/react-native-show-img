//
//  ImageEditor.m
//  GeekTeacherApp
//
//  Created by 甘瑞文 on 2019/9/20.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "ImageEditor.h"
#import "YBImageBrowser.h"
#import "Utils.h"

@interface ImageEditor()

@end

@implementation ImageEditor

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(show:(NSString *)json) {
  
  NSMutableDictionary *dic = [Utils dictionaryWithJsonString:json];
  
  NSMutableArray *images = dic[@"images"];

  NSMutableArray *dataSource = [[NSMutableArray alloc] init];
  for (NSMutableDictionary *image in images) {
    // 本地图片
    YBIBImageData *data = [YBIBImageData new];
    data.imageURL = [NSURL URLWithString:image[@"origImage"]];
    [dataSource addObject:data];
  }

  __weak typeof(self) weakSelf = self;
  dispatch_async(dispatch_get_main_queue(), ^{
    YBImageBrowser *browser = [YBImageBrowser new];
    browser.dataSourceArray = dataSource;
    browser.currentPage = [dic[@"index"] intValue];

//    YBIBSheetAction *edit = [YBIBSheetAction actionWithName:@"编辑" action:^(id<YBIBDataProtocol>  _Nonnull data) {
//        YBIBImageData *imgData = (YBIBImageData *)data;
//        LFPhotoEditingController *lfPhotoEditVC = [[LFPhotoEditingController alloc] init];
//        lfPhotoEditVC.index = browser.currentPage;
//        lfPhotoEditVC.data = dic;
//        lfPhotoEditVC.delegate = weakSelf;
//        [lfPhotoEditVC setEditImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:imgData.imageURL]]];
//        [[weakSelf rootViewController] setNavigationBarHidden:YES];
//        [[weakSelf rootViewController] pushViewController:lfPhotoEditVC animated:YES];
//        [browser.defaultToolViewHandler.sheetView hideWithAnimation:YES];
//
//
//        lfPhotoEditVC.finishBlock = ^(LFPhotoEdit *photoEdit, NSDictionary *data) {
//            callback(@[[NSNull null], data]);
//        };
//    }];
//    [browser.defaultToolViewHandler.sheetView.actions addObject:edit];
    [browser showToView:[weakSelf rootViewController].view];
  });
}

#pragma mark - LFPhotoEdi

- (UINavigationController *)rootViewController
{
  return (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
}

@end
