

#import "SWRegistViewController.h"
#import "SWRegistUserViewController.h"

@interface SWRegistViewController ()
@property (weak, nonatomic) IBOutlet UIButton *registButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation SWRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.registButton addTarget:self action:@selector(registor) forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginButton  addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registor{
    SWRegistUserViewController *ruVC = [[SWRegistUserViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:ruVC];
    [self presentViewController:nav animated:YES completion:nil];

    
}
-(void)login{

    
}


@end
