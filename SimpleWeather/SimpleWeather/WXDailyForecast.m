//
//  WXDailyForecast.m
//  SimpleWeather
//
//  Created by xinxiyuan on 14-6-18.
//  Copyright (c) 2014年 com.shan. All rights reserved.
//

#import "WXDailyForecast.h"

@implementation WXDailyForecast

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSMutableDictionary *paths = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    paths[@"tempHigh"] = @"temp.max";
    paths[@"tempLow"] = @"temp.min";
    return paths;
}

@end
