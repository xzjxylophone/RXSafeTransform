//
//  RXSafeTransform.m
//  RXSafeTransformExample
//
//  Created by ceshi on 17/2/16.
//  Copyright © 2017年 Rush. All rights reserved.
//

#import "RXSafeTransform.h"

@implementation RXSafeTransform





#pragma mark - NSDate And Long Long // use 1970
+ (NSDate *)transformDateFromMilliSecond:(long long)milliSecond
{
    return [self transformDateFromSecond:milliSecond / 1000];
}
+ (NSDate *)transformDateFromSecond:(long long)second
{
    return [NSDate dateWithTimeIntervalSince1970:second];
}



+ (long long)transformMilliSecondFromDate:(NSDate *)date
{
    return [self transformSecondFromDate:date] * 1000;
}

+ (long long)transformSecondFromDate:(NSDate *)date
{
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return (long long)timeInterval;
}


#pragma mark - NSString And NSDate

+ (NSString *)transformStringFromDate:(NSDate *)date formatterString:(NSString *)formatterString
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    return [self transformStringFromDate:date timeZone:timeZone formatterString:formatterString];
}
+ (NSString *)transformStringFromDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone formatterString:(NSString *)formatterString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = timeZone;
    [formatter setDateFormat:formatterString];
    NSString *result = [formatter stringFromDate:date];
    return result;
}

+ (NSDate *)transformDateFromString:(NSString *)string formatterString:(NSString *)formatterString
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    return [self transformDateFromString:string timeZone:timeZone formatterString:formatterString];
}
+ (NSDate *)transformDateFromString:(NSString *)string timeZone:timeZone formatterString:(NSString *)formatterString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterString];
    formatter.timeZone = timeZone;
    NSDate *date = [formatter dateFromString:string];
    return date;
}

#pragma mark - NSString And Long Long // use 1970
+ (NSString *)transformStringFromMilliSecond:(long long)milliSecond formatterString:(NSString *)formatterString
{
    NSDate *date = [self transformDateFromMilliSecond:milliSecond];
    return [self transformStringFromDate:date formatterString:formatterString];
}
+ (NSString *)transformStringFromSecond:(long long)second formatterString:(NSString *)formatterString
{
    NSDate *date = [self transformDateFromSecond:second];
    return [self transformStringFromDate:date formatterString:formatterString];
}
+ (NSString *)transformStringFromMilliSecond:(long long)milliSecond timeZone:(NSTimeZone *)timeZone formatterString:(NSString *)formatterString
{
    NSDate *date = [self transformDateFromMilliSecond:milliSecond];
    return [self transformStringFromDate:date timeZone:timeZone formatterString:formatterString];
}
+ (NSString *)transformStringFromSecond:(long long)second timeZone:(NSTimeZone *)timeZone formatterString:(NSString *)formatterString
{
    NSDate *date = [self transformDateFromSecond:second];
    return [self transformStringFromDate:date timeZone:timeZone formatterString:formatterString];
}

+ (long long)transformMilliSecondFromString:(NSString *)string formatterString:(NSString *)formatterString
{
    return [self transformSecondFromString:string formatterString:formatterString] * 1000;
}

+ (long long)transformMilliSecondFromString:(NSString *)string timeZone:timeZone formatterString:(NSString *)formatterString
{
    return [self transformSecondFromString:string timeZone:timeZone formatterString:formatterString] * 1000;
}

+ (long long)transformSecondFromString:(NSString *)string formatterString:(NSString *)formatterString
{
    NSDate *date = [self transformDateFromString:string formatterString:formatterString];
    return [self transformSecondFromDate:date];
}

+ (long long)transformSecondFromString:(NSString *)string timeZone:timeZone formatterString:(NSString *)formatterString
{
    NSDate *date = [self transformDateFromString:string timeZone:timeZone formatterString:formatterString];
    return [self transformSecondFromDate:date];
}








#pragma mark - NSString And NSData // use UTF-8
+ (NSData *)transformDataFromString:(NSString *)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

+ (NSString *)transformStringFromData:(NSData *)data
{
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}


#pragma mark - NSData And NSDictionary/NSArray

+ (NSData *)transformDataFromJSONObject:(id)object
{
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"error:%@", error);
        return nil;
    }
    return data;
}

+ (id)transformJSONObjectFromData:(NSData *)data
{
    NSError *error;
    id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    if (error) {
        NSLog(@"error:%@", error);
        return nil;
    }
    return object;
}


#pragma mark - NSString And NSDictionary/NSArray // use UTF-8
+ (NSString *)transformStringFromJSONObject:(id)object
{
    NSData *data = [self transformDataFromJSONObject:object];
    return [self transformStringFromData:data];
}

+ (id)transformJSONObjectFromString:(NSString *)string
{
    NSData *data = [self transformDataFromString:string];
    return [self transformJSONObjectFromData:data];
}


#pragma mark - id And NSDictionary NSArray NSString NSNumber
+ (NSDictionary *)transformDictionaryFromID:(id)object
{
    return [self transformDictionaryFromID:object defaultValue:[NSDictionary new]];
}

+ (NSDictionary *)transformDictionaryFromID:(id)object defaultValue:(NSDictionary *)defaultValue
{
    return [self transformIDFromID:object resultCls:[NSDictionary class] defaultValue:defaultValue];

}

+ (NSArray *)transformArrayFromID:(id)object
{
    return [self transformArrayFromID:NSURLIsDirectoryKey defaultValue:[NSArray new]];
}

+ (NSArray *)transformArrayFromID:(id)object defaultValue:(NSArray *)defaultValue
{
    return [self transformIDFromID:object resultCls:[NSNumber class] defaultValue:defaultValue];

}

+ (NSString *)transformStringFromID:(id)object
{
    return [self transformStringFromID:object defaultValue:@""];
}

+ (NSString *)transformStringFromID:(id)object defaultValue:(NSString *)defaultValue
{
    return [self transformIDFromID:object resultCls:[NSNumber class] defaultValue:defaultValue];
}


+ (NSNumber *)transformNumberFromID:(id)object
{
    return [self transformNumberFromID:object defaultValue:@(0)];
}

+ (NSNumber *)transformNumberFromID:(id)object defaultValue:(NSNumber *)defaultValue
{
    return [self transformIDFromID:object resultCls:[NSNumber class] defaultValue:defaultValue];
}


// private
+ (id)transformIDFromID:(id)object resultCls:(Class)cls defaultValue:(id)defalutValue
{
    if ([object isKindOfClass:cls]) {
        return object;
    } else {
        return defalutValue;
    }
}
















































@end
