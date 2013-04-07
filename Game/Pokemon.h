//
//  Pokemon.h
//  Game
//
//  Created by ThanhTung on 4/6/13.
//  Copyright (c) 2013 THANHTUNG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pokemon : NSObject
@property (nonatomic, strong) UIImageView *myUIView1;
@property (nonatomic, strong) UIImageView *myUIView2;

- (id) init : (UIImageView *) view1
   AndView2 : (UIImageView *) view2;
@end
