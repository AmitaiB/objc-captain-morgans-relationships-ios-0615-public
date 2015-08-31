//
//  FISPiratesDataStore.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Zachary Drossman on 10/22/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface FISPiratesDataStore : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSArray *pirates;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
-(void)fetchData;


+ (instancetype) sharedPiratesDataStore;

@end
