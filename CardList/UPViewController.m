//
//  ViewController.m
//  CardList
//
//  Created by yxhe on 16/5/17.
//  Copyright © 2016年 yxhe. All rights reserved.
//

#import "UPViewController.h"
#import "UPCustomCellView.h"

const static float kCustomCellHeight = 100.0;

@interface UPViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *listData; //bankcard number and imglogo

@end


@implementation UPViewController

#pragma mark - view delegate
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //init the tableview
    UITableView *cardTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, self.view.bounds.size.height)];
    cardTableView.dataSource = self;
    cardTableView.delegate = self;
    [self.view addSubview:cardTableView];
    
    
    //parse the json file
    NSString* path = [[NSBundle mainBundle] pathForResource:@"CardProperty" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    
    NSError *error;
    
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData
                                                 options:NSJSONReadingMutableContainers error:&error];
    
    if (!jsonObj || error)
        NSLog(@"JSON parse failed!");
    
    self.listData = [jsonObj objectForKey:@"Record"];
    
    //tableview must reload data
    [cardTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //reuse the customized cell
    static NSString *CellIdentifier = @"UITableViewCell";
    UPCustomCellView *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[UPCustomCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

    //set image and text after the cell init
    //fetch the dictionary
    UIImage *img = [UIImage imageNamed:[self.listData[indexPath.row] objectForKey:@"imgLogo"]];
    [cell setTextLabel:[self.listData[indexPath.row] objectForKey:@"cardNumber"] withImage:img atRow:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //set the tableview cell height
    return kCustomCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"you clicked %dth row", indexPath.row);
    UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"message"
                                                       message:[NSString stringWithFormat:@"cell %d clicked", indexPath.row]
                                                      delegate:self
                                             cancelButtonTitle:@"ok"
                                             otherButtonTitles:nil];
    [alerView show];
}

@end


