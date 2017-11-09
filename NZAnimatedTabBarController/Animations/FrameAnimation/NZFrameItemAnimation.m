//
//  NZFrameItemAnimation.m
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

#import "NZFrameItemAnimation.h"
#import "NSArray+Extension.h"

@interface NZFrameItemAnimation ()

@property (nonatomic, strong) NSMutableArray *animationImages;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, assign) IBInspectable BOOL isDeselectAnimation;
@property (nonatomic, copy) IBInspectable NSString *imagesPath;

@end

@implementation NZFrameItemAnimation

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _isDeselectAnimation = YES;
        _animationImages = [NSMutableArray array];
    }
    
    return self;
}

- (void)createImagesArray:(NSArray *)imageNames
{
    for (NSString *name in imageNames) {
        CGImageRef image = [UIImage imageNamed:name].CGImage;
        [self.animationImages addObject:(__bridge id _Nonnull)(image)];
    }
}

- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    [self playFrameAnimation:icon images:self.animationImages];
    textLabel.textColor = self.textSelectedColor;
}

- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultTextColor
{
    if (self.isDeselectAnimation) {
        [self playFrameAnimation:icon images:[self.animationImages reverse]];
    }
    
    textLabel.textColor = defaultTextColor;
}

- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel
{
    icon.image = self.selectedImage;
    textLabel.textColor = self.textSelectedColor;
}

- (void)playFrameAnimation:(UIImageView *)icon images:(NSArray *)images
{
    CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    frameAnimation.calculationMode = kCAAnimationDiscrete;
    frameAnimation.duration = (NSTimeInterval)self.duration;
    frameAnimation.values = images;
    frameAnimation.repeatCount = 1;
    frameAnimation.removedOnCompletion = NO;
    frameAnimation.fillMode = kCAFillModeForwards;
    [icon.layer addAnimation:frameAnimation forKey:@"frameAnimation"];
}

@end
