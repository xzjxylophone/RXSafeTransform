//
//  MainViewController.m
//  RXSafeTransformExample
//
//  Created by ceshi on 17/2/16.
//  Copyright © 2017年 Rush. All rights reserved.
//

#import "MainViewController.h"
#import "RXSafeTransform.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [self test_transform];
    
    [self test_string_jsonObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Test
- (void)test_transform
{
    NSDictionary *dic = @{@"data":@"\"abc123456"};
    NSData *data = [RXSafeTransform transformDataFromJSONObject:dic];
    NSString *string = [RXSafeTransform transformStringFromData:data];
    NSLog(@"string:%@", string);
}



- (void)test_string_jsonObject
{
    NSDictionary *dic = @{@"data":@"abc123456"};
    NSString *string = [RXSafeTransform transformStringFromJSONObject:dic];
    NSDictionary *dic2 = [RXSafeTransform transformJSONObjectFromString:string];
    NSLog(@"string:%@, dic2:%@", string, dic2);
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
