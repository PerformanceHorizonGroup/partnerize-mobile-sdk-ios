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

#import <Partnerize/PHGDefines.h>

/// Predefined domain for errors from Partnerize SDK
PHG_EXTERN NSString * const PHGErrorDomain;

/// Enum definitions of PHG domain errors
typedef NS_ENUM(NSInteger, PHGError) {
    /// Signifies conversion validation failure due to `clickRef` not set on conversion
    PHGErrorNoClickRefAvailable = 10000,
    /// Signifies `Partnerize.beginConversion()` failure due to nil `url` parameter passed
    PHGErrorInvalidConversionURL,
    /// Signifies conversion item validation failure due to `value` not set on conversion item
    PHGErrorConversionItemNoValueSet,
    /// Signifies conversion item validation failure due to `category` not set on conversion item
    PHGErrorConversionItemNoCategorySet
};
