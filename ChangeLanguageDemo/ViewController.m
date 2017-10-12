//
//  ViewController.m
//  ChangeLanguageDemo
//
//  Created by LarryRodic on 2017/10/11.
//  Copyright © 2017年 Tomato. All rights reserved.
//

#define KSWidth [UIScreen mainScreen].bounds.size.width
#define KSHeight [UIScreen mainScreen].bounds.size.height

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#import "ViewController.h"
#import "Localisator.h"

@interface ViewController ()

@property (nonatomic , strong) UILabel * titleLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveLanguageChangedNotification:) name:kNotificationLanguageChanged object:nil];

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _titleLab=[UILabel new];
    _titleLab.backgroundColor = [UIColor grayColor];
    _titleLab.textColor=[UIColor blackColor];
    _titleLab.textAlignment=NSTextAlignmentCenter;
    _titleLab.font=[UIFont systemFontOfSize:14];
    
    [self.view addSubview:_titleLab];
    _titleLab.frame = CGRectMake(50, 50, KSWidth-100, 60);

    _titleLab.text = LOCALIZATION(@"多语言切换");
    
    
    NSArray*languageArr = [NSArray arrayWithObjects:@"中文",@"英语",@"法语", nil];

    for (int i=0; i<languageArr.count; i++) {
        
        UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = randomColor;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:languageArr[i] forState:UIControlStateNormal];
        button.tag = 100+i;
        [button addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        button.frame = CGRectMake(100, 160+80*i, KSWidth-200, 50);
    }

    
    
}


-(void)selectBtn:(UIButton*)sender{
    [Localisator sharedInstance].saveInUserDefaults = YES;
    

    switch (sender.tag) {
        case 100:
            [[Localisator sharedInstance] setLanguage:@"zh-Hans"];

            break;
        case 101:
            [[Localisator sharedInstance] setLanguage:@"en"];

            break;
        case 102:
            [[Localisator sharedInstance] setLanguage:@"fr"];

            break;
        default:
            [[Localisator sharedInstance] setLanguage:@"zh-Hans"];

            break;
    }
    
    
}


#pragma mark- 多语言切换通知
- (void)receiveLanguageChangedNotification:(NSNotification *) notification
{
    if ([notification.name isEqualToString:kNotificationLanguageChanged])
    {
        _titleLab.text = LOCALIZATION(@"多语言切换");
    }
}


@end
