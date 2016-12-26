//
//  UIControl+Repeat.h
//  ButtonRepeat
//
//  Created by txx on 16/12/26.
//  Copyright © 2016年 txx. All rights reserved.
//

/*
 
 设置Control的子类在一定时间间隔不接受点击事件
 
 */
#import <UIKit/UIKit.h>

@interface UIControl (Repeat)

/*
 类目中添加属性：
 
 1.在.h中添加属性（和普通的属性添加一样）
 2.给新添加的属性重写set、get方法，但是实现和普通的属性不一样，需要在外边申请一个静态地址，然后使用运行时，
 
 具体实现参考本Demo的类目添加属性
 
 
 */

/**
 每隔多久可以再次接受点击事件
 */
@property(nonatomic,assign)NSTimeInterval acceptEventInterval;

/**
 是否忽略点击事件
 */
@property(nonatomic,assign)BOOL ignoreEvent;

@end
