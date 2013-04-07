//
//  Pokemon.m
//  Game
//
//  Created by ThanhTung on 4/6/13.
//  Copyright (c) 2013 THANHTUNG. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon{
}
- (id) init : (UIImageView *) view1
   AndView2 : (UIImageView *) view2{
    if (self == [super init]) {
        _myUIView1 = view1;
        _myUIView2 = view2;
    }
    return self;
}
@end
