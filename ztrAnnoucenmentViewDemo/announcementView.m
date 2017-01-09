//
//  announcementView.m
//  PD-BaoShake
//
//  Created by cocomo on 16/12/30.
//  Copyright © 2016年 cocomo. All rights reserved.
//

#import "announcementView.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@implementation announcementView
{
    UIView *blackView;
}
-(id)initWithTitle:(NSString *)title AndContent:(NSString *)content AndFrame:(CGRect)rect;
{
    self=[super initWithFrame:rect];
    if(self)
    {
     
     
       
        [self setBackgroundColor:[UIColor clearColor]];
        UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(15, 15, kScreenWidth-36-30, rect.size.height-30)];
        [backView setBackgroundColor:[UIColor whiteColor]];
        [backView.layer setMasksToBounds:YES];
        [backView.layer setCornerRadius:6.0f];
        [self addSubview:backView];
        
        
        UIImageView *iv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth-36-30, (kScreenWidth-36-30)/284*112)];
        [iv setImage:[UIImage imageNamed:@"announcement"]];
        [backView addSubview:iv];
        
        UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(iv.frame)+15, kScreenWidth-36-30, 20)];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setTextColor:[UIColor blackColor]];
        [titleLabel setText:title];
        [titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
        [backView addSubview:titleLabel];
        
        NSAttributedString *attributedText;
        attributedText=[[NSAttributedString alloc]initWithAttributedString:[[NSAttributedString alloc] initWithString:content]];
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){kScreenWidth-36-30-10, 20000.0f}
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        CGSize size = rect.size;
        CGFloat height;
        BOOL isScroll;
        if(size.height>250)
        {
            height=250;
            isScroll=YES;
        }
        else
        {
            height=size.height +20;
            isScroll=NO;
        }
        UITextView *contentTextView=[[UITextView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(titleLabel.frame)+15, kScreenWidth-36-30-10, height)];
        [backView addSubview:contentTextView];
        [contentTextView setEditable:NO];
        [contentTextView setFont:[UIFont systemFontOfSize:12]];
        [contentTextView setScrollEnabled:isScroll];
        [contentTextView setAttributedText:attributedText];

        
        [self setFrame:CGRectMake(rect.origin.x, rect.origin.y, kScreenWidth-36, iv.frame.size.height+15+20+15+contentTextView.frame.size.height+20+20)];
        [self setCenter:CGPointMake(kScreenWidth/2, kScreenHeight/2)];
        [backView setFrame:CGRectMake(15, 15, self.frame.size.width-30, self.frame.size.height-30)];
        
        UIButton *closeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn setFrame:CGRectMake(kScreenWidth-36-30, 0, 30, 30)];
        [closeBtn setBackgroundImage:[UIImage imageNamed:@"closeAnnoucement"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(dismissContactView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeBtn];
        
        blackView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        [blackView setBackgroundColor:[UIColor blackColor]];
        [blackView setAlpha:0.7];
        
        /*添加手势事件,移除View*/
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissContactView)];
        [blackView addGestureRecognizer:tapGesture];
  
        
    }
    return self;
}
-(void)show
{
    UIWindow * window = [UIApplication sharedApplication].windows[0];
    [window addSubview:blackView];
    [window addSubview:self];
}
-(void)dismissContactView
{
    [blackView removeFromSuperview];
    [self removeFromSuperview];
}
@end
