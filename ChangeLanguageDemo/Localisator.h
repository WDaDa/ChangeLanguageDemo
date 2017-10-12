//
//  ViewController.h
//  ChangeLanguageDemo
//
//  Created by LarryRodic on 2017/10/11.
//  Copyright © 2017年 Tomato. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LOCALIZATION(text) [[Localisator sharedInstance] localizedStringForKey:(text)]

static NSString * const kNotificationLanguageChanged = @"kNotificationLanguageChanged";

@interface Localisator : NSObject

@property (nonatomic, readonly) NSArray* availableLanguagesArray;   //语言数组
@property (nonatomic, assign) BOOL saveInUserDefaults;     //用户所选语言为默认
@property (nonatomic, copy) NSString * currentLanguage;    //当前语言

+ (Localisator*)sharedInstance;
-(BOOL)setLanguage:(NSString*)newLanguage;

-(NSString *)localizedStringForKey:(NSString*)key;


@end
