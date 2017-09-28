//
//  EditViewController.h
//  testios-le-2
//
//  Created by Guillaume Garcia on 28/09/2017.
//  Copyright © 2017 Telecom Nancy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController

@property NSString *name;
@property NSInteger row;

@property (weak, nonatomic) IBOutlet UITextField *champName;


@end
