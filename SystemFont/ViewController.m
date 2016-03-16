//
//  ViewController.m
//  SystemFont
//
//  Created by yangtibing on 16/3/15.
//  Copyright © 2016年 Autohome Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *rootTable;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArr = [NSMutableArray arrayWithCapacity:0];
    
    NSArray *familys = [UIFont familyNames];
    
    for (int i = 0; i<[familys count]; i++) {
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
        
        NSString *family = [familys objectAtIndex:i];
        NSArray *fonts = [UIFont fontNamesForFamilyName:family];
        
        [dict setObject:family forKey:@"familyName"];
        [dict setObject:fonts forKey:@"fontNameArr"];
        
        [_dataArr addObject:dict];
        
//        NSLog(@"Fontfamily:%@=====",family);
        
//        for (int j = 0; j<[fonts count]; j++) {
//            
//            NSLog(@"FontName:%@",[fonts objectAtIndex:j]);
//            
//        }
    }
    
    [_rootTable reloadData];
}

#pragma mark - tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSDictionary *dict = _dataArr[section];
    
    return [NSString stringWithFormat:@"familyName: %@",dict[@"familyName"]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 0.5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSDictionary *dict = _dataArr[section];
    NSArray *arr = dict[@"fontNameArr"];
    return arr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell"];
    
    NSDictionary *dict = _dataArr[indexPath.section];
    NSArray *arr = dict[@"fontNameArr"];

    NSString *fontName = arr[indexPath.row];
    
    cell.textLabel.font = [UIFont fontWithName:fontName size:14];
    cell.textLabel.text = fontName;
    
    cell.detailTextLabel.font = [UIFont fontWithName:fontName size:11];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"这段文字是 %@ 字体,1234567890",fontName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
