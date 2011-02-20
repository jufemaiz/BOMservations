//
//  RootViewController.h
//  BOMServations
//
//  Created by Patrick Quinn-Graham on 20/02/11.
//  Copyright 2011 Patrick Quinn-Graham. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ObservationRetriever;

@interface RootViewController : UITableViewController {

    ObservationRetriever *retriever;
    
    dispatch_queue_t worker;
    
    UIBarButtonItem *refresh;
    
}

@property (nonatomic, retain) NSArray *observations;


@end
