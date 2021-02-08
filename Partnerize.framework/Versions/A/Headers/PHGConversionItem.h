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

NS_ASSUME_NONNULL_BEGIN

/// PHGConversionItem represents items included in conversion (like products or customer purchase items). It must contain value and category in order for Partnerize to successfully submit conversion for tracking.
NS_SWIFT_NAME(ConversionItem)
@interface PHGConversionItem : NSObject

/// Required conversion item parameter: `value`
@property (nonatomic, copy, nullable) NSString *value;
/// Required conversion item parameter: `category`
@property (nonatomic, copy, nullable) NSString *category;

/// Optional conversion item parameter: `quantity`
@property (nonatomic, copy, nullable) NSString *quantity;
/// Optional conversion item parameter: `sku`
@property (nonatomic, copy, nullable) NSString *sku;
/// Optional conversion parameters: `metadata` may contain custom {`key` : `value`} conversion item attributes
@property (nonatomic, copy, nullable) NSDictionary<NSString *, NSString *> *metadata;

/// Convenience initialiser with non-nil value
- (instancetype)initWithValue:(nullable NSString *)value;
/// Convenience initialiser with non-nil value and category
- (instancetype)initWithValue:(nullable NSString *)value category:(nullable NSString *)category;
/// Convenience initialiser with non-nil value, category and quantity
- (instancetype)initWithValue:(nullable NSString *)value category:(nullable NSString *)category quantity:(nullable NSString *)quantity;
/// Convenience initialiser with non-nil value, category, quantity and sku
- (instancetype)initWithValue:(nullable NSString *)value category:(nullable NSString *)category quantity:(nullable NSString *)quantity sku:(nullable NSString *)sku;

/// Designated initialiser with non-nil value, category, quantity, sku and metadata
- (instancetype)initWithValue:(nullable NSString *)value category:(nullable NSString *)category quantity:(nullable NSString *)quantity sku:(nullable NSString *)sku metadata:(nullable NSDictionary<NSString *, NSString*> *)metadata NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
