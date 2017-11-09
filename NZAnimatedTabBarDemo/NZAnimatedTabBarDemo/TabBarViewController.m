//
//  TabBarViewController.m
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

#import "TabBarViewController.h"

#import "NZAnimatedTabBarController.h"
#import "NZAnimatedTabBarItem.h"
#import "NZIconView.h"

// View Controllers
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

// Animations
#import "NZBounceAnimation.h"
#import "NZFumeAnimation.h"
#import "NZRotationAnimation.h"
#import "NZFrameItemAnimation.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    // First ViewController
    NZBounceAnimation *bounceAnimation = [[NZBounceAnimation alloc] init];
    bounceAnimation.textSelectedColor = [UIColor blueColor];
    bounceAnimation.iconSelectedColor = [UIColor blueColor];
    
    NZAnimatedTabBarItem *firstTabBarItem = [[NZAnimatedTabBarItem alloc] initWithTitle:@"Bounce Animation" image:[UIImage imageNamed:@"drop"] selectedImage:nil];
    firstTabBarItem.animation = bounceAnimation;
    firstTabBarItem.textColor = [UIColor greenColor];
    UIImageView *firstIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drop"]];
    UILabel *firstLabel = [[UILabel alloc] init];
    firstLabel.text = @"Bounce Animation";
    firstTabBarItem.iconView = [[NZIconView alloc] initWithIcon:firstIconView textLabel:firstLabel];
    
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    firstNav.tabBarItem = firstTabBarItem;
    
    // Second ViewController
    NZFumeAnimation *fumeAnimation = [[NZFumeAnimation alloc] init];
    fumeAnimation.textSelectedColor = [UIColor blueColor];
    fumeAnimation.iconSelectedColor = [UIColor blueColor];
    
    NZAnimatedTabBarItem *secondTabBarItem = [[NZAnimatedTabBarItem alloc] initWithTitle:@"Fume Animation" image:[UIImage imageNamed:@"icon_pin"] selectedImage:nil];
    secondTabBarItem.animation = fumeAnimation;
    secondTabBarItem.textColor = [UIColor redColor];
    UIImageView *secondIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_pin"]];
    UILabel *secondLabel = [[UILabel alloc] init];
    secondLabel.text = @"Fume Animation";
    secondTabBarItem.iconView = [[NZIconView alloc] initWithIcon:secondIconView textLabel:secondLabel];
    
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondViewController];
    secondNav.tabBarItem = secondTabBarItem;
    
    // Third ViewController
    NZRotationAnimation *rotationAnimation = [[NZRotationAnimation alloc] init];
    rotationAnimation.textSelectedColor = [UIColor blueColor];
    rotationAnimation.iconSelectedColor = [UIColor blueColor];
    
    NZAnimatedTabBarItem *thirdTabBarItem = [[NZAnimatedTabBarItem alloc] initWithTitle:@"Rotation Animation" image:[UIImage imageNamed:@"icon_user"] selectedImage:nil];
    thirdTabBarItem.animation = rotationAnimation;
    thirdTabBarItem.textColor = [UIColor yellowColor];
    UIImageView *thirdIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_user"]];
    UILabel *thirdLabel = [[UILabel alloc] init];
    thirdLabel.text = @"Rotation Animation";
    thirdTabBarItem.iconView = [[NZIconView alloc] initWithIcon:thirdIconView textLabel:thirdLabel];
    
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:thirdViewController];
    thirdNav.tabBarItem = thirdTabBarItem;
    
    // Fourth ViewController
    NZFrameItemAnimation *frameAnimation = [[NZFrameItemAnimation alloc] init];
    frameAnimation.textSelectedColor = [UIColor brownColor];
    frameAnimation.iconSelectedColor = [UIColor blueColor];
    frameAnimation.duration = 0.5f;
    [frameAnimation createImagesArray:@[@"Tools_00028",@"Tools_00029", @"Tools_00030", @"Tools_00031", @"Tools_00032", @"Tools_00033",
                                        @"Tools_00034", @"Tools_00035", @"Tools_00036", @"Tools_00037", @"Tools_00038", @"Tools_00039",
                                        @"Tools_00040", @"Tools_00041", @"Tools_00042", @"Tools_00043", @"Tools_00044", @"Tools_00045",
                                        @"Tools_00046", @"Tools_00047", @"Tools_00048", @"Tools_00049", @"Tools_00050", @"Tools_00051",
                                        @"Tools_00052", @"Tools_00053", @"Tools_00054", @"Tools_00055", @"Tools_00056", @"Tools_00057",
                                        @"Tools_00058", @"Tools_00059", @"Tools_00060", @"Tools_00061", @"Tools_00062", @"Tools_00063",
                                        @"Tools_00064", @"Tools_00065"]];
    
    
    NZAnimatedTabBarItem *fourthTabBarItem = [[NZAnimatedTabBarItem alloc] initWithTitle:@"Frame Animation" image:[UIImage imageNamed:@"Tools_00028"] selectedImage:nil];
    fourthTabBarItem.animation = frameAnimation;
    fourthTabBarItem.textColor = [UIColor brownColor];
    UIImageView *fourthIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Tools_00028"]];
    UILabel *fourthLabel = [[UILabel alloc] init];
    thirdLabel.text = @"Frame Animation";
    thirdTabBarItem.iconView = [[NZIconView alloc] initWithIcon:fourthIconView textLabel:fourthLabel];
    
    
    FourthViewController *fourthViewController = [[FourthViewController alloc] init];
    UINavigationController *fourthNav = [[UINavigationController alloc] initWithRootViewController:fourthViewController];
    fourthNav.tabBarItem = fourthTabBarItem;
    
    
    self.viewControllers = @[firstNav, secondNav, thirdNav, fourthNav];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
