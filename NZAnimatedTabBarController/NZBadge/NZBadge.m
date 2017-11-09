//
//  NZBadge.m
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

#import "NZBadge.h"

@implementation NZBadge

+ (NZBadge *)bage
{
    return [[NZBadge alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.layer.backgroundColor = [UIColor redColor].CGColor;
        self.layer.cornerRadius = frame.size.width / 2;
        
        [self configureNumberLabel];
        
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        // constraints
        [self createSizeConstraints:frame.size];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)createSizeConstraints:(CGSize)size
{
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1
                                                                         constant:size.width];
    [self addConstraint:widthConstraint];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:size.height];
    [self addConstraint:heightConstraint];
}

- (void)configureNumberLabel
{
    self.textAlignment = NSTextAlignmentCenter;
    self.font = [UIFont systemFontOfSize:13.0];
    self.textColor = [UIColor whiteColor];
}

- (void)addBadgeOnView:(UIView *)onView
{
    [onView addSubview:self];
    
    // create constraints
    self.topConstraint = [NSLayoutConstraint constraintWithItem:self
                                                      attribute:NSLayoutAttributeTop
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:onView
                                                      attribute:NSLayoutAttributeTop
                                                     multiplier:1
                                                       constant:3];
    if (self.topConstraint) {
        [onView addConstraint:self.topConstraint];
    }
    
    self.centerXConstraint = [NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:onView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:10];
    if (self.centerXConstraint) {
        [onView addConstraint:self.centerXConstraint];
    }
}



@end
