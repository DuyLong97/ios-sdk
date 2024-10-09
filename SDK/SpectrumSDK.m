//
//  CustomFramework.m
//  SDK
//
//  Created by Long Pham on 12/7/24.
//

#import <SDK/SpectrumSDK.h>
#import <SpectrumKit/SpectrumKit.h>
#import <SpectrumKit/FSPDefaultPlugin.h>

@implementation SpectrumSDK

+ (SpectrumSDK *)instance {
    static SpectrumSDK *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (NSData *)compressImage:(UIImage *)image {
    FSPEncodeRequirement *encodeRequirement =
        [FSPEncodeRequirement encodeRequirementWithFormat:FSPEncodedImageFormat.jpeg
                                                     mode:FSPEncodeRequirementModeLossy
                                                  quality:80];

    FSPTransformations *transformations = [FSPTransformations new];
    transformations.resizeRequirement =
        [[FSPResizeRequirement alloc] initWithMode:FSPResizeRequirementModeExact
                                        targetSize:CGSizeMake(1440, 1440)];

    FSPEncodeOptions *options =
        [FSPEncodeOptions encodeOptionsWithEncodeRequirement:encodeRequirement
                                             transformations:transformations
                                                    metadata:nil
                                               configuration:nil
                         outputPixelSpecificationRequirement:nil];
    
    NSError *error;
    FSPResultData *result = [FSPSpectrum.sharedInstance encodeImage:image options:options error:&error];
    
    NSLog(@"Hello World");
    
    return result.data;
}

@end
