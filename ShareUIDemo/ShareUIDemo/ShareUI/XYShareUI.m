//
//  XYShareUI.m
//  Ticket
//
//  Created by weizejian on 16/6/7.
//  Copyright © 2016年 yexianyong. All rights reserved.
//

#import "XYShareUI.h"
#import "XYShareBtnView.h"
//标题字体大小
#define titFont 13.0f
//每排3个图标
#define column 5
//间隙
#define pin 15.0f

// MainScreen Height&Width
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width



@implementation XYShareUI
{
    CGRect downFrame;
    CGRect upFrame;
    
    UIView *holdView;
    BOOL isUpState;
}

- (instancetype)initWithItems:(NSArray*)items
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        
        
        NSInteger row = items.count/column+(items.count%column>0?1:0);
        CGFloat width=(Main_Screen_Width-pin*(column+1))/column;
        CGFloat height=width*1.3;
        
        CGFloat all_H=row*height+(row+1)*pin;
        
        
        upFrame=CGRectMake(0, Main_Screen_Height-all_H, Main_Screen_Width, all_H);
        downFrame=CGRectMake(0, Main_Screen_Height, Main_Screen_Width, all_H);
        
        UIView* backView=[[UIView alloc]initWithFrame:self.bounds];
        backView.backgroundColor=[UIColor clearColor];
        
        [self addSubview:backView];
        
        holdView=[[UIView alloc]initWithFrame:downFrame];
        
        
        //更改holdView背景颜色
        
        holdView.backgroundColor=[UIColor lightGrayColor];
        
        //添加按钮
        
        NSInteger i=0;
        for (NSDictionary* dic in items) {
            XYShareBtnView* btn=[[XYShareBtnView alloc]initWithFrame:CGRectMake(pin+(width+pin)*(i%column), pin+(height+pin)*(i/column), width, height)];
            
            btn.dic=dic;
            
            btn.sendBlock=^(NSString* title){
                if (self.sendBlock) {
                    self.sendBlock(title);
                    [self dismiss];
                }
            
            };
                        
            [holdView addSubview:btn];
            
            i++;
        }
        
        
        
        
        
        
        
        
        
        [self addSubview:holdView];
        
        
        UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}
-(void)payClick:(UIButton*)sender{
    if (self.sendBlock) {
        self.sendBlock(sender);
    }
}

-(void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:0.2 delay:0.0 options:0 animations:^{
        [holdView setFrame:upFrame];
    }completion:^(BOOL finished) {
    }];
}
-(void)dismiss{
    [self tapClick];
}
-(void)tapClick{
    
    //向下移动消失
    
    [UIView animateWithDuration:0.2 delay:0.0 options:0 animations:^{
       
        [holdView setFrame:downFrame];
        
    }completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
    
}

@end
