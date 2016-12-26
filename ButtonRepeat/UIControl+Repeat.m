//
//  UIControl+Repeat.m
//  ButtonRepeat
//
//  Created by txx on 16/12/26.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "UIControl+Repeat.h"
#import <objc/runtime.h>


static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_ignoreEvent         = "UIControl_ignoreEvent";

@implementation UIControl (Repeat)

//分类实现主类的方法会有警告：category is implementing a method which will be also be implemented by its primary class.
//-(void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
//{
//    
//}
/**
 创建对象时就会调用
 */
+(void)load
{
    Method system = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method custom = class_getInstanceMethod(self, @selector(custom_sendAction:to:forEvent:));
    method_exchangeImplementations(system, custom);
    
}
/**
 和系统方法@selector(sendAction:to:forEvent:)交换的方法，判断相应方法与否

 @param action button绑定的方法
 @param target Button的target，本Demo是ViewController
 @param event 点击事件
 */
-(void)custom_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    //如果不接受点击事件就返回
    if (self.ignoreEvent) return ;
    
    if (self.acceptEventInterval > 0) {
        //在间隔时间内设置不接受点击事件
        self.ignoreEvent = YES;
        //间隔时间结束设置接受点击事件
        [self performSelector:@selector(setIgnoreEvent:) withObject:@(NO) afterDelay:self.acceptEventInterval];
    }
    [self custom_sendAction:action to:target forEvent:event];
}

#pragma mark - **************** 重写属性的set、get方法 ****************

-(NSTimeInterval)acceptEventInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval)doubleValue];
}
-(void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)ignoreEvent
{
    return [objc_getAssociatedObject(self, UIControl_ignoreEvent)boolValue];
}
-(void)setIgnoreEvent:(BOOL)ignoreEvent
{
    objc_setAssociatedObject(self, UIControl_ignoreEvent, @(ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
