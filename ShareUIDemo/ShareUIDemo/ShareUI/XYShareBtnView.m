//
//  XYShareBtnView.m
//  Ticket
//
//  Created by weizejian on 16/6/7.
//  Copyright © 2016年 yexianyong. All rights reserved.
//

#import "XYShareBtnView.h"
#define ratio 0.7


@interface XYShareBtnView ()

@property(nonatomic,strong)UIButton* btn;

@property(nonatomic,strong)UILabel* titleLab;

@end

@implementation XYShareBtnView

-(void)setDic:(NSDictionary *)dic{
    
    _dic=dic;
    
    
    CGRect frame=CGRectMake((self.frame.size.width-self.frame.size.height*ratio)/2.0, 0, self.frame.size.height*ratio, self.frame.size.height*ratio);
    self.btn=[[UIButton alloc]initWithFrame:frame];
    [self.btn setBackgroundImage:[UIImage imageNamed:dic[@"img"]] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.btn];
    
    
    //btn 与label 的距离
    CGFloat distance=5;
    self.titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.btn.frame)+distance, self.frame.size.width, self.frame.size.height*(1-ratio)-distance)];
    self.titleLab.text=dic[@"title"];
    self.titleLab.textAlignment=NSTextAlignmentCenter;
    self.titleLab.font=[UIFont systemFontOfSize:11];
    self.titleLab.textColor=[UIColor whiteColor];
    [self addSubview: self.titleLab];


}

-(void)click:(UIButton*)btn{
    if (self.sendBlock) {
        self.sendBlock(self.dic[@"title"]);
    }
}


@end
