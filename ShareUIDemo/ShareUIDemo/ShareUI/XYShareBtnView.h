//
//  XYShareBtnView.h
//  Ticket
//
//  Created by weizejian on 16/6/7.
//  Copyright © 2016年 yexianyong. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^SendViewBlock)(id sender);

@interface XYShareBtnView : UIView

@property (nonatomic,copy)SendViewBlock sendBlock;


/**
 *  btn字典  key:img/title
 */
@property(nonatomic,strong)NSDictionary* dic;

@end
