//
//  NZRotationAnimation.m
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

#import "NZRotationAnimation.h"

@implementation NZRotationAnimation

- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    [self playRoatationAnimation:icon];
    textLabel.textColor = self.textSelectedColor;
}

- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultTextColor
{
    textLabel.textColor = defaultTextColor;
    
    UIImage *iconImage = icon.image;
    if (iconImage) {
        UIImage *renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        icon.image = renderImage;
        icon.tintColor = defaultTextColor;
    }
}

- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    textLabel.textColor = self.textSelectedColor;
    
    UIImage *iconImage = icon.image;
    if (iconImage) {
        UIImage *renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        icon.image = renderImage;
        icon.tintColor = self.textSelectedColor;
    }
}

- (void)playRoatationAnimation:(UIImageView *)icon
{
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.fromValue = @0.0;
    
    CGFloat toValue = (CGFloat)(M_PI * 2.0);
    if (self.direction == NZRotationDirectionLeft) {
        toValue = toValue * -1.0;
    }
    
    rotateAnimation.toValue = @(toValue);
    rotateAnimation.duration = (NSTimeInterval)self.duration;
    
    [icon.layer addAnimation:rotateAnimation forKey:@"rotation360"];
    
    UIImage *iconImage = icon.image;
    if (iconImage) {
        UIImage *renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        icon.image = renderImage;
        icon.tintColor = self.iconSelectedColor;
    }
}

@end
