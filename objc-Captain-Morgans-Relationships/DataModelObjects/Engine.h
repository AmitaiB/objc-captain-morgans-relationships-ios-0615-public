//
//  Engine.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Amitai Blickstein on 8/31/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ship;

@interface Engine : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) Ship *installedIn;

@end
