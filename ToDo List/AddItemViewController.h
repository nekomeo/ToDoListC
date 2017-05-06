//
//  AddItemViewController.h
//  ToDo List
//
//  Created by Elle Ti on 2017-05-02.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddItemViewControllerDelegate <NSObject>

- (void)didSaveNewToDo:(NSString *)toDoText;

@end

@interface AddItemViewController : UIViewController

@property (nonatomic, strong) id <AddItemViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
