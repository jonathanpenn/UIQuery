//
//  CMNDetailViewController.h
//  UIQueryTest
//
//  Created by Jonathan Penn on 7/12/12.
//  Copyright (c) 2012 Navel Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMNDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
