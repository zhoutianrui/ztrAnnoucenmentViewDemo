//
//  announcementView.h
//  PD-BaoShake
//
//  Created by cocomo on 16/12/30.
//  Copyright © 2016年 cocomo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface announcementView : UIView
-(id)initWithTitle:(NSString *)title AndContent:(NSString *)content AndFrame:(CGRect)rect;
-(void)show;
@end
