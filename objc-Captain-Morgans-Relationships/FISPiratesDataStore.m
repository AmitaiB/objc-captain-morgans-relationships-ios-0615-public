//
//  FISPiratesDataStore.m
//  objc-Captain-Morgans-Relationships
//
//  Created by Zachary Drossman on 10/22/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import "FISPiratesDataStore.h"
#import "Pirate.h"
#import "Ship.h"
#import "Engine.h"

@implementation FISPiratesDataStore
@synthesize managedObjectContext = _managedObjectContext;

static NSString * const pirate = @"Pirate";
static NSString * const ship   = @"Ship";
static NSString * const engine = @"Engine";

# pragma mark - Singleton

+ (instancetype)sharedPiratesDataStore {
    static FISPiratesDataStore *_sharedPiratesDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedPiratesDataStore = [[FISPiratesDataStore alloc] init];
    });

    return _sharedPiratesDataStore;
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }


    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"objcCMR.sqlite"];

    NSError *error = nil;

    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"objcCMR" withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];

    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - test data

-(void) generateTestData
{
    // TODO: create test data
    NSManagedObjectContext *moc = self.managedObjectContext;
    
    Pirate *atomsk = [self makePirate:@"Atomsk"];
    Ship *Nota
    
//    =============
    Pirate *balthier = [self makePirate:@"Balthier"];
    Ship *strahl = [self makeShip:@"Strahl" withOwner:balthier];
    Engine *airStrahl = [self makeEngineOfType:@"Airship" forShip:strahl];

    
//    =============
    Pirate *kidd = [self makePirate:@"William Kidd"];
    
    Ship *galley = [self makeShip:@"Adventure Galley" withOwner:kidd];
    Engine *merchantGalley = [self makeEngineOfType:@"Merchant" forShip:galley];
    
    Ship *revenge = [self makeShip:@"New York Revenge" withOwner:kidd];
    Engine *ukRevenge = [self makeEngineOfType:@"unknown" forShip:revenge];
    
//    =============
    Pirate *roberts = [self makePirate:@"Bartholomew Roberts"];
    
    Ship *fortune = [self makeShip:@"Good Fortune" withOwner:roberts];
    Engine *ukFortune = [self makeEngineOfType:@"unknown" forShip:fortune];
    
    Ship *ranger = [self makeShip:@"Little Ranger" withOwner:roberts];
    Engine *sloopRanger = [self makeEngineOfType:@"Sloop" forShip:ranger];
    
    Ship *seaKing = [self makeShip:@"Sea King" withOwner:roberts];
    Engine *brigKing = [self makeEngineOfType:@"Brigantine" forShip:seaKing];
    
    
    // save and refetch
    [self saveContext];
    [self fetchData];
}

- (void)fetchData
{
    // TODO: make an NSFetchRequest, execute and fill datastore
    
    // TODO: finish this so it will generate test data if your datastore is empty
    if (<#yourStorageArrayProperty#>.count == 0) {
        [self generateTestData];
    }
}

-(Pirate*)makePirate:(NSString*)name {
    Pirate *temp = [NSEntityDescription insertNewObjectForEntityForName:pirate inManagedObjectContext:self.managedObjectContext];
    temp.name = name;
    return temp;
}

-(Ship*)makeShip:(NSString*)shipName withOwner:(Pirate*)owner {
    Ship *temp = [NSEntityDescription insertNewObjectForEntityForName:ship inManagedObjectContext:self.managedObjectContext];
    temp.name = shipName;
    temp.owner = owner;
    return temp;
}

-(Engine*)makeEngineOfType:(NSString*)type forShip:(Ship*)ship {
    Engine *temp = [NSEntityDescription insertNewObjectForEntityForName:engine inManagedObjectContext:self.managedObjectContext];
    temp.type = type;
    temp.installedIn = ship;
    return temp;
}

@end
