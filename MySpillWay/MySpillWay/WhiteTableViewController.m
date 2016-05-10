//
//  WhiteTableViewController.m
//  MySpillWay
//
//  Created by 刘华军 on 16/3/3.
//  Copyright © 2016年 JoyLiu. All rights reserved.
//

#import "WhiteTableViewController.h"
#import "SWMainPageViewController.h"
#import "UIColor+RandomColor.h"
#import "SWRegistViewController.h"
#import  "SWPersonInfoViewController.h"
#import "SWChooseFormLoginViewController.h"
#import  "SWReleaseViewController.h"
#import "BasicCell.h"
@interface WhiteTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mytableView;
@property (nonatomic,strong) NSArray *dataList;
@property (nonatomic ,strong) UINavigationController *navigatinVC;
@end

@implementation WhiteTableViewController
static NSString *BasicCell1 = @"BasicCell1";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
    self.title = @"主界面";
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
    //改变navigationBar的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(setting1)];
    NSBundle *bundle = [NSBundle mainBundle];
    //加载plist文件
    NSURL *plistURL = [bundle URLForResource:@"testinfo" withExtension:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSMutableArray *temDataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [dictionary count]; i++) {
        NSString *key = [[NSString alloc] initWithFormat:@"%i",i+1];
        NSDictionary *temDic = [dictionary objectForKey:key];
        [temDataArray addObject:temDic];
    }
    self.dataList = [temDataArray copy];
    NSLog(@"self.dataList ---%@",self.dataList);
}
/**
 初始化板块主页
 */
-(void)initTableView{
    [_mytableView registerNib:[UINib nibWithNibName:@"BasicCell" bundle:nil] forCellReuseIdentifier:BasicCell1];
}
-(void)setting1{
    
    SWPersonInfoViewController *piVC = [[SWPersonInfoViewController alloc] init];
//    [self presentViewController:piVC animated:YES completion:nil];
    [self.navigationController pushViewController:piVC animated:YES];
}
- (void)didTapNextButton {
//    SWReleaseViewController *reVC = [[SWReleaseViewController alloc] init];
    SWChooseFormLoginViewController *cfVC = [[SWChooseFormLoginViewController alloc] init];
//    SWRegistViewController *regLog = [[SWRegistViewController alloc] init];
    [self presentViewController:cfVC animated:YES completion:nil];
//    [self.navigationController pushViewController:cfVC animated:NO];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataList count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 163.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   BasicCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:BasicCell1 forIndexPath:indexPath];
    NSInteger row = [indexPath row];
    NSDictionary *rowData = [self.dataList objectAtIndex:row];
//    NSLog(@"rowData -- %@",rowData);
    cell.Avatar = [rowData objectForKey:@"Avatar"];
//    cell.nick = [rowData objectForKey:@"nick"];
//    NSLog(@"%@",cell.nick);
    cell.releaseTime = [rowData objectForKey:@"releaseTime"];
    cell.priseBtn = [rowData objectForKey:@"priseBtn"];
    cell.praiseNum = [rowData objectForKey:@"praiseNum"];
    cell.commentBtn = [rowData objectForKey:@"commentBtn"];
    cell.commentNum = [rowData objectForKey:@"commentNum"];
    cell.content = [rowData objectForKey:@"content"];
    cell.image1 = [rowData objectForKey:@"image1"];
    cell.image2 = [rowData objectForKey:@"image2"];
    cell.image3= [rowData objectForKey:@"image3"];
    cell.image4 = [rowData objectForKey:@"image4"];
    
    UIImageView *avatar = (UIImageView *)[cell viewWithTag:0];
    UILabel *nickname = (UILabel *)[cell viewWithTag:1];
    UILabel *time = (UILabel *)[cell viewWithTag:2];
    UILabel *priselabel = (UILabel *)[cell viewWithTag:4];
    UIButton *priseBtn = (UIButton *)[cell viewWithTag:3];
    UILabel *conmmentLabel = (UILabel *)[cell viewWithTag:6];
    UIButton *commentBtn = (UIButton *)[cell viewWithTag:5];
    UILabel *content = (UILabel *)[cell viewWithTag:7];
    UIImageView *image1 = (UIImageView *)[cell viewWithTag:8];
    UIImageView *image2 = (UIImageView *)[cell viewWithTag:9];
    UIImageView *image3 = (UIImageView *)[cell viewWithTag:10];
    UIImageView *image4 = (UIImageView *)[cell viewWithTag:11];
    
    //    image.layer.cornerRadius = 17.5;
    //
    //    [self addSubview:image];
//    avatar.image = [UIImage imageNamed:[rowData objectForKey:@"Avatar"]];
    NSLog(@"[rowData objectForKey:0-----%@",[rowData objectForKey:@"Avatar"]);
    nickname.text = [rowData objectForKey:@"nick"];
    time.text = [rowData objectForKey:@"releaseTime"];
    priselabel.text = [rowData objectForKey:@"praiseNum"];
    priseBtn.imageView.image = [UIImage imageNamed:[rowData objectForKey:@"priseBtn"]] ;
    conmmentLabel.text = [rowData objectForKey:@"commentNum"];
    commentBtn.imageView.image = [UIImage imageNamed:[rowData objectForKey:@"commentBtn"]];
    NSLog(@"[rowData objectForKey:----%@",[rowData objectForKey:@"commentBtn"]);
    content.text = [rowData objectForKey:@"content"];
    image1.image = [UIImage imageNamed:[rowData objectForKey:@"image1"]];
    image2.image = [UIImage imageNamed:[rowData objectForKey:@"image2"]];
    image3.image = [UIImage imageNamed:[rowData objectForKey:@"image3"]];
    image4.image = [UIImage imageNamed:[rowData objectForKey:@"image4"]];
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
//    // Navigation logic may go here, for example:
//    // Create the next view controller.
//    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
//    
//    // Pass the selected object to the new view controller.
//    
//    // Push the view controller.
//    [self.navigationController pushViewController:detailViewController animated:YES];
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
