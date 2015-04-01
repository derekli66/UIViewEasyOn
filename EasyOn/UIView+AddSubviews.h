//
//  DDContentView+Missing.h
//  ObjectiveCPractice
//
//  Created by LEE CHIEN-MING on 3/30/15.
//  Copyright (c) 2015 Derek. All rights reserved.
//

#import "UIView+EasyOn.h"

/**
 Add any UIView subclass adding methods.
 
 Format:
 - (id)add<#subclassOfUIView#>:(UIViewCreationBlock)aBlock;
 
 @warning No need to make any implementations for those category methods
 
 */
@interface UIView (AddSubviews)
- (id)addUIView:(UIViewCreationBlock)aBlock;

- (id)addUILabel:(UIViewCreationBlock)aBlock;

- (id)addUIImageView:(UIViewCreationBlock)aBlock;

- (id)addUIScrollView:(UIViewCreationBlock)aBlock;

- (id)addUITextField:(UIViewCreationBlock)aBlock;
@end
