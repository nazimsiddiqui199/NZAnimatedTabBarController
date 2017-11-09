//
//  NZTransitionItemAnimations.m
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

#import "NZTransitionItemAnimations.h"

@implementation NZTransitionItemAnimations

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _transitionOptions = UIViewAnimationOptionTransitionNone;
    }
    
    return self;
}

- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    [self selectedColor:icon textLabel:textLabel];
    
    [UIView transitionWithView:icon duration:(NSTimeInterval)self.duration options:self.transitionOptions animations:^{
    
    } completion:^(BOOL finished) {
        
    }];
}

- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultTextColor
{
    UIImage *iconImage = icon.image;
    if (iconImage) {
        UIImage *renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        icon.image = renderImage;
        textLabel.textColor = defaultTextColor;
    }
}

- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    [self selectedColor:icon textLabel:textLabel];
}

- (void)selectedColor:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    if (self.iconSelectedColor != nil) {
        UIImage *iconImage = icon.image;
        if (iconImage) {
            UIImage *renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            icon.image = renderImage;
            icon.tintColor = self.iconSelectedColor;
        }
        
        textLabel.textColor = self.textSelectedColor;
    }
}

@end
