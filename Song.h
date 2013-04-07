//
//  Song.h
//  Day7DiskManage
//
//  Created by ThanhTung on 3/27/13.
//  Copyright (c) 2013 THANHTUNG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject{
    
}
@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) NSString* single;
@property (nonatomic,assign) int year;
@property (nonatomic,strong) NSString* genre;
-(id) initWithTitle : (NSString*) title1
          andSingle : (NSString*) single1
            andYear : (int) year1
           andGenre : (NSString*) genre1;
@end
