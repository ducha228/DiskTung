//
//  Song.m
//  Day7DiskManage
//
//  Created by ThanhTung on 3/27/13.
//  Copyright (c) 2013 THANHTUNG. All rights reserved.
//

#import "Song.h"

@implementation Song
-(id) initWithTitle : (NSString*) title1
          andSingle : (NSString*) single1
            andYear : (int) year1
           andGenre : (NSString*) genre1{
    if (self == [super init]) {
        self.title = title1;
        self.single = single1;
        self.year = year1;
        self.genre = genre1;
    }
    return self;
}
-(NSString* )description{
    NSString *desc = [NSString stringWithFormat:@"Title: %@ and Single: %@ and Year: %d and Genre: %@",self.title,self.single,self.year,self.genre];
    return desc;
}
@end
