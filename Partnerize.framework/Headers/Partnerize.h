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

#import <Foundation/Foundation.h>
#import <Partnerize/PHGConversion.h>
#import <Partnerize/PHGError.h>
#import <Partnerize/PHGConversionTrafficSource.h>
#import <Partnerize/PHGConversionMetric.h>
#import <Partnerize/PHGClick.h>
NS_ASSUME_NONNULL_BEGIN

/// Typealias for block which will be called upon conversion completion
typedef void (^PHGConversionHandler)(BOOL success, NSError * __nullable error) NS_SWIFT_NAME(ConversionHandler);

/// Partnerize handles Partnerize SaaS conversion tracking flow, which includes creation of conversion value object, optional conversion customisation and submission for tracking.
@interface Partnerize : NSObject

/**
 Internally created conversion object which is preconfigured and ready
 for further setup and submission.
 
 Default conversion object must contain *clickRef* for successful submission.
 */
@property (class, nonatomic, readonly, nullable) PHGConversion *conversion;

/**
 Controls logging output.
 Default value is `false`.
 */
@property (class, nonatomic, getter=isLoggingEnabled) BOOL enableLogging;

/**
 Prepares internal conversion object using Universal Link for further use
 when conversion is completed.
 
 - Parameter url: Universal Link url containing app_clickref=<clickref> value.
 
 - Throws: `PHGError.invalidConversionURL`
 if `url` is nil.
 
 - Returns: A new url containing original `url` with app_clickref parameter stripped.
 */
+ (nullable NSURL *)beginConversionWithURL:(nullable NSURL *)url error:(NSError * __nullable __autoreleasing * __nullable)errorPtr;



+ (nullable PHGClick *)beginConversion:(nullable NSURL *)url error:(NSError * __nullable __autoreleasing * __nullable)errorPtr;



/**
 Finalises conversion by calling Partnerize SaaS with configured PHGConversion conversion object.
 
 - Parameter completion: block which will be called upon completion with `success` status and
 PHGError `error`. It may contain conversion validation or NSURLError type error in case of failure.
 */
+ (void)completeConversionWithCompletionHandler:(PHGConversionHandler)completion;

@end

NS_ASSUME_NONNULL_END
