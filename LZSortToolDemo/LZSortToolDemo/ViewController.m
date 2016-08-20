//
//  ViewController.m
//  LZSortToolDemo
//
//  Created by Artron_LQQ on 16/8/20.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "LZSortTool.h"
#import "People.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource> {
    
    NSMutableArray *_dataSource;
}

@property (nonatomic,strong)NSMutableArray *nameArray;

@end

@implementation ViewController

- (NSMutableArray *)nameArray {
    if (!_nameArray) {
        _nameArray = [[NSMutableArray alloc]initWithObjects:@"鲁迅",@"###",@"刘一",@"赵四",@"钱",@"李三",@"孙五",@"王二",@"黄蓉",@"孙悟空",@"哪吒",@"李天王",@"范冰冰",@"赵丽颖",@"霍建华",@"黄晓明",@"成龙",@"李连杰",@"李小龙",@"曾小贤",@"LiShan", nil];
    }
    
    return _nameArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arr = [LZSortTool sortStrings:self.nameArray withSortType:LZSortResultTypeSingleValue];
    NSArray *arr1 = [LZSortTool sortStrings:self.nameArray withSortType:LZSortResultTypeDoubleValues];
    
    NSLog(@"arr======%@",arr);
    NSLog(@"arr1======%@",arr1);
    
    NSMutableArray *pArray = [NSMutableArray arrayWithCapacity:0];
    for (NSString *str in self.nameArray) {
        People *p = [[People alloc]init];
        p.name = str;
        p.age = arc4random()%90 + 10;
        
        [pArray addObject:p];
    }
    
    NSArray *pArr = [LZSortTool sortObjcs:pArray byKey:@"name" withSortType:LZSortResultTypeDoubleValues];
    
    _dataSource = [NSMutableArray arrayWithArray:pArr];
    
    NSLog(@"%@",pArr);
    
    
    UITableView *table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSDictionary *dic = [_dataSource objectAtIndex:section];
    return [[dic objectForKey:LZSortToolValueKey] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
    }
    
    NSDictionary *dic = [_dataSource objectAtIndex:indexPath.section];
    People *p = [[dic objectForKey:LZSortToolValueKey] objectAtIndex:indexPath.row];
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"年龄--%ld----",(long)p.age];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSDictionary *dic = [_dataSource objectAtIndex:section];
    
    return [dic objectForKey:LZSortToolKey];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
