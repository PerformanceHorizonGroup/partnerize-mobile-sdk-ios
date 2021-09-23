//
//  PHGClick.h
//  Partnerize
//
//  Created by Tom Harnasz on 30/08/2019.
//  Copyright © 2019 Performance Horizon Group LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Click)
@interface PHGClick : NSObject

@property (nonatomic, copy) NSString *clickRef;
@property (nonatomic, copy) NSString *camRef;
@property (nonatomic, copy) NSURL *destination;
@property (nonatomic, copy, nullable) NSURL *destinationMobile;
@property (nonatomic, copy) NSDictionary<NSString*, NSString*> *utmParams;
@property (nonatomic, copy) NSDictionary<NSString*, NSString*> *meta;

@end

NS_ASSUME_NONNULL_END
