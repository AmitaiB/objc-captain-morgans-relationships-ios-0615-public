//
//  Ship.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Amitai Blickstein on 8/31/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Ship : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject *owner;
@property (nonatomic, retain) NSManagedObject *hasInstalled;

@end
