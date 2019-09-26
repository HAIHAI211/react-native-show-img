
#import "RNShowImg.h"
#import "YBImageBrowser.h"
#import "Utils.h"

@interface RNShowImg()

@end

@implementation RNShowImg

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

    [browser showToView:[weakSelf rootViewController].view];
  });
}

#pragma mark - LFPhotoEdi

- (UINavigationController *)rootViewController
{
  return (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
}

@end
