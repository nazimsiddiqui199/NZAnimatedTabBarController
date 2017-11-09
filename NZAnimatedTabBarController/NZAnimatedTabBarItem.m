//
//  NZAnimatedTabBarItem.m
//The MIT License (MIT)
//
//Copyright (c) 2017 Nazim Siddiqui
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.


//

#import "NZAnimatedTabBarItem.h"
#import "NZBadge.h"

@interface NZAnimatedTabBarItem ()

@property (nonatomic, strong) NZBadge *badge;

@end

@implementation NZAnimatedTabBarItem

- (NSString *)badgeValue
{
    if (self.badge) {
        return self.badge.text;
    }
    return nil;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    if (badgeValue == nil) {
        if (self.badge) {
            [self.badge removeFromSuperview];
            self.badge = nil;
        }
        return ;
    }
    
    if (self.badge == nil) {
        self.badge = [NZBadge bage];
        
        UIView *containerView = self.iconView.icon.superview;
        if (containerView) {
            [self.badge addBadgeOnView:containerView];
        }
    }
    
    if (self.badge) {
        self.badge.text = badgeValue;
    }
}

- (void)playAnimation
{
    NSAssert(self.animation != nil, @"add animation in UITabBarItem");
    if (self.animation != nil && self.iconView != nil) {
        [self.animation playAnimation:self.iconView.icon textLabel:self.iconView.textLabel];
    }
}

- (void)deselectAnimation
{
    if (self.animation != nil && self.iconView != nil) {
        [self.animation deselectAnimation:self.iconView.icon textLabel:self.iconView.textLabel defaultTextColor:self.textColor];
    }
}

- (void)selectedState
{
    if (self.animation != nil && self.iconView != nil) {
        [self.animation selectedState:self.iconView.icon textLabel:self.iconView.textLabel];
    }
}

@end
