//
//  LYMListItem.h
//  zhibo
//
//  Created by 李勇猛 on 2017/12/2.
//  Copyright © 2017年 李勇猛. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LYMCreatorItem;
@interface LYMListItem : NSObject
/** 直播流地址 */
@property (nonatomic, copy) NSString *stream_addr;
/** 关注人 */
@property (nonatomic, assign) NSUInteger online_users;
/** 城市 */
@property (nonatomic, copy) NSString *city;
/** 主播 */
@property (nonatomic,strong) LYMCreatorItem *creator;

@end
