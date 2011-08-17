//
//  GearExperimentViewController.m
//  GearExperiment
//
//  Created by Kevin Donnelly on 8/16/11.
//  Copyright 2011 -. All rights reserved.
//

#import "GearExperimentViewController.h"

@implementation GearExperimentViewController
@synthesize gearRight;
@synthesize gearLeft;
@synthesize tableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setGearRight:nil];
    [self setGearLeft:nil];
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma TableViewDataSource
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row #%i", indexPath.row];
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

#pragma -
#pragma TableViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    gearLeft.transform = CGAffineTransformMakeRotation(-0.002*scrollView.contentOffset.y);
    gearRight.transform = CGAffineTransformMakeRotation(0.002*scrollView.contentOffset.y);
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //Shrink scrollView size...
    NSLog(@"Begin!");
    [UIView beginAnimations:@"Shrinkydink" context:nil];
    [UIView setAnimationDuration:0.2];
    [tableView setFrame:CGRectMake(20, 0, 280, 460)];
    [UIView commitAnimations];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //Expand scrollView size...
    NSLog(@"End Dragging");
    if (!decelerate) {
        [UIView beginAnimations:@"Unshrinkydink" context:nil];
        [UIView setAnimationDuration:0.1];
        [tableView setFrame:CGRectMake(0, 0, 320, 460)];
        [UIView commitAnimations];
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"End Deceleratig");
    [UIView beginAnimations:@"Unshrinkydink" context:nil];
    [UIView setAnimationDuration:0.1];
    [tableView setFrame:CGRectMake(0, 0, 320, 460)];
    [UIView commitAnimations];
}

#pragma -

@end
