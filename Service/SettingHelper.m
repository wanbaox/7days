//
//  SettingHelper.m
//  BTstackCocoa
//
//  Created by wan on 13-2-28.
//
//

#import "SettingHelper.h"


@implementation SettingHelper



+(BOOL)isBootFirstTime
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    BOOL notBootFirst = [defaults boolForKey:@"key_setting_not_boot_first"];
    
    if (!notBootFirst) {
        
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"key_setting_not_boot_first"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return !notBootFirst;
}

@end
