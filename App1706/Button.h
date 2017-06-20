//
//  Button.h
//  App1706
//
//  Created by iOS-School-1 on 17.06.17.
//  Copyright © 2017 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreGraphics;

/**
 Список кнопок

 - ButtonTypeDefault: Стандартная кнопка
 - ButtonTypeAdd: Кнопка добавления
 - ButtonTypeRemove: Кнопка удаления
 */
typedef NS_ENUM(NSInteger, ButtonType){
    ButtonTypeDefault,
    ButtonTypeAdd,
    ButtonTypeRemove
};

@interface Button : NSObject

/**
 Конструктор кнопки

 @param type Тип создаваемой кнопки
 @return Button
 */
+ (instancetype)buttonWithType:(ButtonType)type;

/**
 Метод отрисовывающий кнопку
 */
- (void)draw;

/**
 Метод возвращающий размер кнопки

 @return <#return value description#>
 */
- (CGSize)size;

@end
