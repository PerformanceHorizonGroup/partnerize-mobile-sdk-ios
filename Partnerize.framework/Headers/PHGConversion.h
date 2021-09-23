////////////////////////////////////////////////////////////////////////////
//
// Copyright 2019 Performance Horizon Group LTD.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

#import <Partnerize/PHGConversionItem.h>
#import <Partnerize/PHGCustomerType.h>

NS_ASSUME_NONNULL_BEGIN

/// PHGConversion represents an active conversion. It contains all the required and optional information in order for Partnerize to successfully submit conversion for tracking.
NS_SWIFT_NAME(Conversion)
@interface PHGConversion : NSObject

/// Required conversion parameter: `clickref`. Set up after `Partnerize.beginConversion()` with valid url is called.
@property (nonatomic, readonly) NSString *clickRef;
/// Optional conversion parameter: `pubref`
@property (nonatomic, copy, nullable) NSString *pubRef;
/// Optional conversion parameter: `adref`
@property (nonatomic, copy, nullable) NSString *adRef;
/// Optional conversion parameter: `country`
@property (nonatomic, copy, nullable) NSString *country;
/// Optional conversion parameter: `currency`
@property (nonatomic, copy, nullable) NSString *currency;
/// Optional conversion parameter: `conversionRef`
@property (nonatomic, copy, nullable) NSString *conversionRef;
/// Optional conversion parameter: `custRef`
@property (nonatomic, copy, nullable) NSString *custRef;
/// Optional conversion parameter: `voucher`
@property (nonatomic, copy, nullable) NSString *voucher;
/// Optional conversion parameters: `metadata` may contain custom {`key` : `value`} conversion attributes
@property (nonatomic, copy, nullable) NSDictionary<NSString *, NSString *> *metadata;
/// Optional conversion parameter: `items`. If `items` set, each `item` must contain non-empty `value` and `category` properties
@property (nonatomic, copy, nullable) NSArray<PHGConversionItem *> *items;
/// Optional conversion parameter: `tsource` (Traffic Source). Constants defined in PHGConversionTrafficSource.h can be used here.
@property (nonatomic, copy, nullable) NSString *tsource;
/// Optional conversion parameter: `tmetric`. Constants defined in PHGConversionMetric.h can be used here.
@property (nonatomic, copy, nullable) NSString *tmetric;
/// Optional conversion parameter: `customerType`
@property (nonatomic) PHGCustomerType customerType;

/**
 Validates conversion using all the provided conversion properties.
 
 - Parameter error: optional 'error' pointer, which will contain PHGError
 in case of failure.
 
 - Throws: `PHGError` if conversion is not valid for submission.
 
 - Returns: validation result status.
 */
- (BOOL)validate:(NSError * __nullable __autoreleasing * __nullable)errorPtr;

/// Clears the conversion click reference
- (void)clearClickref;

@end

NS_ASSUME_NONNULL_END
