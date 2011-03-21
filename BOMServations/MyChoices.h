//
//  MyChoices.h
//  BOMServations
//
//  Created by Patrick Quinn-Graham on 16/03/11.
//  Copyright 2011 Patrick Quinn-Graham. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyChoices : UITableViewController {
    
    UIBarButtonItem *addStation;
}

@property (nonatomic, retain) IBOutlet UIBarButtonItem *addStation;
@property (nonatomic, retain) NSArray *choices;

- (IBAction)addStation:(id)sender;

- (void)reloadData;

@end
