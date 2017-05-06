//
//  ViewController.m
//  ToDo List
//
//  Created by Elle Ti on 2017-05-02.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ViewController.h"
#import "ListTableViewCell.h"
#import "AddItemViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, AddItemViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *toDos;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDos = [[NSMutableArray alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"ListTableViewCell";
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell)
    {
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
//    cell.titleLabel.text = @"Hello"; //Semantic issue: Property 'text' not found in object of type 'UIView*'
    NSString *toDoText = self.toDos[indexPath.row];
    cell.titleLabel.text = toDoText; //Property 'text' not found in object of type 'UIView*'
//    [cell.titleLabel:toDoText]; //Property 'text' not found in object of type 'UIView*'
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Hello I was touched: %@", indexPath);
} //NS_AVAILABLE_IOS(3_0)

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *nav = segue.destinationViewController;
    AddItemViewController *addVC = nav.viewControllers[0];
    addVC.delegate = self;
}

- (void)didSaveNewToDo:(NSString *)toDoText {
    [self.toDos addObject:toDoText];
    [self.tableView reloadData];
//    NSLog(@"%@", todoText);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.toDos removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}

@end
