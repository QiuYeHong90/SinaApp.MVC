//
//  SinaViewController.m
//  SinaApp.MVC
//
//  Created by mac on 16/5/18.
//  Copyright © 2016年 mac. All rights reserved.
//
#import "NSString+Extension.h"
#import "SinaViewController.h"
#import "SinaTableViewCell.h"
#import "MJRefresh.h"
@interface SinaViewController ()<SinaToolDelegate,LogViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *mutDataAarray;
}
@end

@implementation SinaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SinaTool * sinaTool = [SinaTool sharedInstance];
    sinaTool.delegate = self;
   
   
    mutDataAarray = [[NSMutableArray alloc]init];
    if ([sinaTool islogin]||[sinaTool isValid]) {
        NSLog(@"登录了,并且没有过期");
        
        [self refreshWith:sinaTool];
        
    }
    else{
        LogView *logView = [[LogView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:logView];
        
        self.tabBarController.tabBar.hidden= YES;
        
        logView.delegate =self;
        [logView startOauthRequest:[sinaTool oauthRequest]];
    }
   
    
}

-(void)refreshWith:(SinaTool*)tool
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"++++++");
        [tool refeashDataWith:self];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.tableView.mj_header endRefreshing];
        });
        
    }];
   
    
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"----我在加载中");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.tableView.mj_footer endRefreshing];
        });
    }];
}
#pragma mark -- 单元格
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mutDataAarray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SinaTableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[SinaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.status = mutDataAarray[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SinaStatuses * status = mutDataAarray[indexPath.row];
    NSLog(@"status.cellRetweetedHeight==%f ---%f",status.cellRetweetedPicuterHeight,status.cellRetweetTextHeith);
    return 120+ status.cellTextHeight+status.cellViewHeight +status.cellRetweetedPicuterHeight+ status.cellRetweetTextHeith;
}
#pragma mark -- 获取token
-(void)sinaTool:(SinaTool*)sinaTool didGetToken:(NSString*)token
{
    NSLog(@"token==%@",token);
//    获取首页数据
    [sinaTool getDataHomeTimelineWithToken:token];
}
-(void)sinaTool:(SinaTool*)sinaTool didFailedWithError:(NSError*)error
{
    NSLog(@"error==%@",error);
}


-(void)sinaTool:(SinaTool *)sinaTool didGetDataWithSinaBase:(SinaBaseClass *)sinaBase
{
    [mutDataAarray setArray:sinaBase.statuses];
    [self.tableView reloadData];
}

-(void)loginView:(LogView*)log didFailWithError:(NSError*)error
{
    NSLog(@"error==%@",error);
}
#pragma mark -- 获取code
-(void)loginView:(LogView *)log didGetCodeString:(NSString *)codeString
{
    NSLog(@"codeString==%@",codeString);
    SinaTool * sinaTool = [SinaTool sharedInstance];
    [sinaTool getAccessTokenWithCode:codeString];
    [log removeFromSuperview];
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
