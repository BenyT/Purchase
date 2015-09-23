//
//  purchasePch.h
//  YXLPurchaseDemo
//
//  Created by 叶星龙 on 15/9/23.
//  Copyright © 2015年 yexinglong. All rights reserved.
//

#ifndef purchasePch_h
#define purchasePch_h

#import "Masonry.h"

#define kScreenBounds [[UIScreen                          mainScreen]bounds]
#define kWindowWidth  ([[UIScreen mainScreen]             bounds].size.width)
#define kWindowHeight ([[UIScreen mainScreen]             bounds].size.height)

#ifndef CGWidth
#define CGWidth(rect)                   rect.size.width
#endif

#ifndef CGHeight
#define CGHeight(rect)                  rect.size.height
#endif

#ifndef CGOriginX
#define CGOriginX(rect)                 rect.origin.x
#endif

#ifndef CGOriginY
#define CGOriginY(rect)                 rect.origin.y
#endif

#endif /* purchasePch_h */
