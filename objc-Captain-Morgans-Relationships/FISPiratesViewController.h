//
//  FISPiratesViewController.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Zachary Drossman on 10/22/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISPiratesDataStore.h"

@interface FISPiratesViewController : UITableViewController

@property (nonatomic, strong) FISPiratesDataStore *sharedStore;

@end
