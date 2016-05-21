//
//  SWPersonInfoViewController.m
//  MySpillWay
//
//  Created by 刘华军 on 16/5/6.
//  Copyright © 2016年 JoyLiu. All rights reserved.
//

#import "SWPersonInfoViewController.h"
#import "Bmob.h"
#import "SWSetScreenTableViewController.h"
#import  "SWModiNickViewController.h"
@interface SWPersonInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SWPersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人";
    //标题
    self.navigationItem.title = @"个人";
    //返回箭头的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //导航栏的颜色
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//tableView 左边短15像素的问题
-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    static  NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
    CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
//    //tableView 左边短15像素的问题
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
    
    //获取当前用户的数据
    BmobUser *bUser = [BmobUser getCurrentObject];
    NSLog(@"bUser 设置界面%@",bUser);
    if (bUser) {
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
                imageView.image = [UIImage imageNamed:@"86.png"];
                [cell.contentView addSubview:imageView];
                imageView.layer.masksToBounds = YES;
                imageView.layer.cornerRadius = 30;
                /*
                 
                 self.myAvatar.frame = CGRectMake(60,60, 40, 40);
                 
                 self.myAvatar.layer.masksToBounds =YES;
                 
                 self.myAvatar.layer.cornerRadius =50;
                 
                 [self.view addSubview:self.myAvatar];
                 */

                    UILabel *cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 150, 15)];
                    cellLabel.textColor = [UIColor grayColor];
                    cellLabel.text = [NSString stringWithFormat:@"ID:%@",bUser.objectId];
                    [cell.contentView addSubview:cellLabel];
                
            }
        }
        if (indexPath.section == 1) {
            cell.textLabel.textColor = [UIColor grayColor];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            if (indexPath.row == 0) {
                cell.textLabel.text = [NSString stringWithFormat:@"  昵称 ： %@",[bUser objectForKey:@"nick"]];
            }else if (indexPath.row == 1) {
                cell.textLabel.text = [NSString stringWithFormat:@"  职业 ： %@",[bUser objectForKey:@"position"]];
//                cell.textLabel.text = @"  职业 ： 学生";
            }else if (indexPath.row == 2) {
                cell.textLabel.text = [NSString stringWithFormat:@"  爱好 ： %@",[bUser objectForKey:@"hobby"]];
//                cell.textLabel.text = @"  爱好 ： 睡觉";
            }else if (indexPath.row == 3) {
                cell.textLabel.text = [NSString stringWithFormat:@"  注册时间 ： %@",[bUser objectForKey:@"createdAt"]];
//                cell.textLabel.text = @"  注册时间 ： 2016-5-6";
            }else if (indexPath.row == 4) {
                cell.textLabel.text = @"  设置界面";
            }
        } 
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            SWModiNickViewController *mnVC = [[SWModiNickViewController alloc] init];
            [self.navigationController pushViewController:mnVC animated:YES];
        }
        if (indexPath.row == 4) {
            SWSetScreenTableViewController *detailViewController = [[SWSetScreenTableViewController alloc] init];
            [self.navigationController pushViewController:detailViewController animated:YES];
        
        }
    }
    //取消点击之后的状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
