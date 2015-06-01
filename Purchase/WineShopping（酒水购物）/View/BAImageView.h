//
//  BAImageView.h
//  BarAssistant
//
//  Created by 叶星龙 on 15/5/5.
//  Copyright (c) 2015年 局外者科技. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BAImageViewControlEvents) {
    BAImageViewControlEventTap,
    BAImageViewControlEventLongPressBegan,
    BAImageViewControlEventLongPressEnd,
};

@interface BAImageView : UIImageView

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(BAImageViewControlEvents)controlEvents;


@end
