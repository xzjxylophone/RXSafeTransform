//
//  RXSafeTransform.h
//  RXSafeTransformExample
//
//  Created by ceshi on 17/2/16.
//  Copyright © 2017年 Rush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXSafeTransform : NSObject


#pragma mark - NSDate And Long Long // use 1970
+ (NSDate *)transformDateFromMilliSecond:(long long)milliSecond;
+ (NSDate *)transformDateFromSecond:(long long)second;
+ (long long)transformMilliSecondFromDate:(NSDate *)date;
+ (long long)transformSecondFromDate:(NSDate *)date;



#pragma mark - NSString And NSDate // use Asia/Shanghai
+ (NSString *)transformStringFromDate:(NSDate *)date formatterString:(NSString *)formatterString;
+ (NSString *)transformStringFromDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone formatterString:(NSString *)formatterString;
+ (NSDate *)transformDateFromString:(NSString *)string formatterString:(NSString *)formatterString;
+ (NSDate *)transformDateFromString:(NSString *)string timeZone:timeZone formatterString:(NSString *)formatterString;



#pragma mark - NSString And Long Long // use 1970 and use Asia/Shanghai
+ (NSString *)transformStringFromMilliSecond:(long long)milliSecond formatterString:(NSString *)formatterString;
+ (NSString *)transformStringFromSecond:(long long)second formatterString:(NSString *)formatterString;
+ (NSString *)transformStringFromMilliSecond:(long long)milliSecond timeZone:(NSTimeZone *)timeZone formatterString:(NSString *)formatterString;
+ (NSString *)transformStringFromSecond:(long long)second timeZone:(NSTimeZone *)timeZone formatterString:(NSString *)formatterString;
+ (long long)transformMilliSecondFromString:(NSString *)string formatterString:(NSString *)formatterString;
+ (long long)transformMilliSecondFromString:(NSString *)string timeZone:timeZone formatterString:(NSString *)formatterString;
+ (long long)transformSecondFromString:(NSString *)string formatterString:(NSString *)formatterString;
+ (long long)transformSecondFromString:(NSString *)string timeZone:timeZone formatterString:(NSString *)formatterString;





#pragma mark - NSString And NSData // use UTF-8
+ (NSData *)transformDataFromString:(NSString *)string;
+ (NSString *)transformStringFromData:(NSData *)data;



#pragma mark - NSData And NSDictionary/NSArray
+ (NSData *)transformDataFromJSONObject:(id)object;
+ (id)transformJSONObjectFromData:(NSData *)data;



#pragma mark - NSString And NSDictionary/NSArray // use UTF-8
+ (NSString *)transformStringFromJSONObject:(id)object;
+ (id)transformJSONObjectFromString:(NSString *)string;



#pragma mark - id And NSDictionary NSArray NSString NSNumber
+ (NSDictionary *)transformDictionaryFromID:(id)object;
+ (NSDictionary *)transformDictionaryFromID:(id)object defaultValue:(NSDictionary *)defaultValue;
+ (NSArray *)transformArrayFromID:(id)object;
+ (NSArray *)transformArrayFromID:(id)object defaultValue:(NSArray *)defaultValue;
+ (NSString *)transformStringFromID:(id)object;
+ (NSString *)transformStringFromID:(id)object defaultValue:(NSString *)defaultValue;
+ (NSNumber *)transformNumberFromID:(id)object;
+ (NSNumber *)transformNumberFromID:(id)object defaultValue:(NSNumber *)defaultValue;






















@end
