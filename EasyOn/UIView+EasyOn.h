//
//  UIView+EasyOn.h
//  ObjectiveCPractice
//
//  Created by LEE CHIEN-MING on 3/31/15.
//  Copyright (c) 2015 Derek. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIViewCreationBlock)(id subview);

@interface UIView (EasyOn)
/**
 The 'add' block will run immediately and add a subview on self.
 
 UIViewCreationBlock will responsible for subview customization.
 */
@property (nonatomic, strong, readonly) id (^add)(Class ofUIViewSubclass, UIViewCreationBlock aBlock);
@end
