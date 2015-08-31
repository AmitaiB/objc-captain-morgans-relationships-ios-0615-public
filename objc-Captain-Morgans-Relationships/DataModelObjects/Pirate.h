//
//  Pirate.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Amitai Blickstein on 8/31/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ship;

@interface Pirate : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *owns;
@end

@interface Pirate (CoreDataGeneratedAccessors)

- (void)addOwnsObject:(Ship *)value;
- (void)removeOwnsObject:(Ship *)value;
- (void)addOwns:(NSSet *)values;
- (void)removeOwns:(NSSet *)values;

@end
