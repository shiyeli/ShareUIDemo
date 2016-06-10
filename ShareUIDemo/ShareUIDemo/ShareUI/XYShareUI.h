//
//  XYShareUI.h
//  Ticket
//
//  Created by weizejian on 16/6/7.
//  Copyright © 2016年 yexianyong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SendViewBlock)(id sender);


@interface XYShareUI : UIView


@property (nonatomic,copy)SendViewBlock sendBlock;

/**
 *  初始化
 *
 *  @param items 数组里面存储按钮对应的:字典_key:img/title 图片/标题
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithItems:(NSArray*)items;

-(void)show;
-(void)dismiss;

@end
