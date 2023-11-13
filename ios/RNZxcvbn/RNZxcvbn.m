#import "RNZxcvbn.h"
#import "DBZxcvbn.h"
#import <React/RCTLog.h>

@implementation RNZxcvbn {
    DBZxcvbn *zxcvbn;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(score: (NSString*)password
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject
                  )
{
    if (zxcvbn == nil) {
        zxcvbn = [[DBZxcvbn alloc] init];
    }
    DBResult *result = [zxcvbn passwordStrength:password];
    RCTLogInfo(@"GOT a result %@ with %@", result.score);
    NSDictionary *dictRes = @{
        @"score":@(result.score)
    };
    resolve(dictRes);
}

@end
