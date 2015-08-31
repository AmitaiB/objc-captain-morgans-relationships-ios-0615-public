//
//  FISShipsViewController.h
//  objc-Captain-Morgans-Relationships
//
//  Created by Zachary Drossman on 10/22/14.
//  Copyright (c) 2014 Zachary Drossman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pirate.h"
#import "Ship.h"

@interface FISShipsViewController : UITableViewController

@property (nonatomic, strong) Pirate *selectedPirate;
@property (nonatomic, strong) NSArray *ships;

@end
