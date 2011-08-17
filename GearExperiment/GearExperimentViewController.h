//
//  GearExperimentViewController.h
//  GearExperiment
//
//  Created by Kevin Donnelly on 8/16/11.
//  Copyright 2011 -. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GearExperimentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    UIImageView *gearRight;
    UIImageView *gearLeft;
    UITableView *tableView;
}

@property (nonatomic, strong) IBOutlet UIImageView *gearRight;
@property (nonatomic, strong) IBOutlet UIImageView *gearLeft;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
