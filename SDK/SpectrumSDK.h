//
//  CustomFramworkHeader.h
//  SDK
//
//  Created by Long Pham on 12/7/24.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SpectrumSDK : NSObject

+ (SpectrumSDK *)instance;
- (NSData *)compressImage:(UIImage *)image;

@end
