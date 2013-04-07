//
//  ViewController.m
//  Game
//
//  Created by ThanhTung on 4/6/13.
//  Copyright (c) 2013 THANHTUNG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableArray *_arrView;
    NSMutableArray *_arrPokemon;
    NSMutableArray *_arrImage;
    UIImageView *tmpView;
    NSMutableArray *_arrView1;
    UIImageView *_backGroundView;
    UISlider *mySlider;
    UILabel *timeRemain;
    UILabel *lblInfor;
    Pokemon *pkm;
    BOOL _ok;
    NSTimer* _timer;
    int dem;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dem = 0;
    tmpView = nil;
	_ok = YES;
    _backGroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    _backGroundView.image = [UIImage imageNamed:@"Apple.jpeg"];
    mySlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    lblInfor = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, 320, 30)];
    lblInfor.textColor = [UIColor colorWithRed:100 green:0 blue:0 alpha:1];
    [lblInfor setText:@"By Phan Thanh Tung-D10CN6-ProPtit"];
    [self.view addSubview:_backGroundView];
    mySlider.maximumTrackTintColor = [UIColor redColor];
    mySlider.minimumTrackTintColor = [UIColor greenColor];
    mySlider.maximumValue = 60;
    mySlider.minimumValue = 0;
    mySlider.value = mySlider.maximumValue;
    [self.view addSubview:lblInfor];
    timeRemain = [[UILabel alloc] initWithFrame:CGRectMake(150, 20, 50, 30)];
    NSString *tg = [NSString stringWithFormat:@"%d",(int)mySlider.value];
    timeRemain.textColor = [UIColor colorWithRed:100 green:0 blue:0 alpha:1];
    [timeRemain setText:tg];
    [self.view addSubview:timeRemain];
    [_timer invalidate];
    _timer = nil;
    if(!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                       target:self
                                                     selector:@selector(print)
                                                     userInfo:nil
                                                      repeats:YES];
    } else {
        [_timer invalidate];
        _timer=nil;
    }
    [self.view addSubview:mySlider];
    _arrImage = [[NSMutableArray alloc]initWithObjects:
                       [UIImage imageNamed : @"pokemon001.JPG"],
                       [UIImage imageNamed : @"pokemon002.JPG"],
                       [UIImage imageNamed : @"pokemon003.JPG"],
                       [UIImage imageNamed : @"pokemon004.JPG"],
                       [UIImage imageNamed : @"pokemon005.JPG"],
                       [UIImage imageNamed : @"pokemon006.JPG"],
                       [UIImage imageNamed : @"pokemon007.JPG"],
                       [UIImage imageNamed : @"pokemon008.JPG"],
                       [UIImage imageNamed : @"pokemon009.JPG"],
                       [UIImage imageNamed : @"pokemon010.JPG"],
                       [UIImage imageNamed : @"pokemon011.JPG"],
                       [UIImage imageNamed : @"pokemon012.JPG"],
                       nil];
    _arrPokemon = [[NSMutableArray alloc] init];
    _arrView = [[NSMutableArray alloc] init];
    _arrView1 = [[NSMutableArray alloc] init];
    for (int i =  5; i <= 280; i+=75) {
        NSMutableArray *mutarr = [[NSMutableArray alloc] init];
        for (int j = 60; j<=340; j+=75) {
            UIImageView *myview1 = [[UIImageView alloc] initWithFrame:CGRectMake(i, j, 60, 60)];
            UIImageView *myview2 = [[UIImageView alloc] initWithFrame:CGRectMake(i, j, 60, 60)];
            int k = arc4random() % 11;
            myview1.image = [UIImage imageNamed:@"Pokemon.jpg"];
            myview2.image = [_arrImage objectAtIndex : k];
            pkm = [[Pokemon alloc] init:myview1 AndView2:myview2];
            [mutarr addObject:pkm];
        }
        [_arrPokemon addObject:mutarr];
    }
    for (NSMutableArray *arrmut in _arrPokemon) {
        for ( pkm in arrmut) {
            pkm.myUIView1.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget : self
                                                                            action : @selector(flip:)];
            [_arrView addObject: pkm.myUIView2];
            pkm.myUIView1.userInteractionEnabled = YES;
            [pkm.myUIView1 addGestureRecognizer : tap];
            pkm.myUIView1.tag = dem;
            [self.view addSubview: pkm.myUIView1];
            dem++;
        }
    }
    int x = _arrView.count / 2;
    for (int i = 0; i < x; i++) {
        int m = arc4random()%(_arrView.count - 1);
        [_arrView1 addObject:[_arrView objectAtIndex:m]];
    }
    NSMutableArray *tmpArr = [[NSMutableArray alloc] init];
    for (UIImageView *view in _arrView1) {
        [tmpArr addObject:view];
    }
    for (int i = 0; i< x; i++) {
        int m = arc4random() % (tmpArr.count);
        [_arrView1 addObject:[tmpArr objectAtIndex:m]];
        [tmpArr removeObjectAtIndex:m];
    }
    dem = _arrView1.count;
    NSLog(@"%d",dem);
}
- (void) print{
    [mySlider removeFromSuperview];
    mySlider.value = mySlider.value - 1;
    [self.view addSubview:mySlider];
    [timeRemain removeFromSuperview];
    NSString *tg = [NSString stringWithFormat:@"%d",(int)mySlider.value];
    timeRemain.textColor = [UIColor colorWithRed:100 green:0 blue:0 alpha:1];
    [timeRemain setText:tg];
    [self.view addSubview:timeRemain];
    NSLog(@"%d",dem);
    if (dem > 0 && mySlider.value == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You Lose :(\n Are you want to play Again" message: @"OK" delegate:self cancelButtonTitle:[self noButtonTitle] otherButtonTitles:[self yesButtonTitle], nil];
        [alertView show];
        [_timer invalidate];
        _timer = nil;
    }
    else if (dem == 0 && mySlider.value >=0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"congratulation\n Are you want to play Again" message: @"OK" delegate:self cancelButtonTitle:[self noButtonTitle] otherButtonTitles:[self yesButtonTitle], nil];
        [alertView show];
        [_timer invalidate];
        _timer = nil;
    }
}
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:[self yesButtonTitle]]){
        [self viewDidLoad];
    }
    else if ([buttonTitle isEqualToString:[self noButtonTitle]]){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Thank you" message:@"See again" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alertView show];
    }
}
-(NSString *)yesButtonTitle{
    return @"Yes";
}
-(NSString *)noButtonTitle{
    return @"NO";
}
- (BOOL) compare : (UIImage*) image1 isEquaTo : (UIImage*) image2{
    NSData *data1 = UIImagePNGRepresentation(image1);
    NSData *data2 = UIImagePNGRepresentation(image2);
    return [data1 isEqual:data2];
}
- (void) flip: (UIGestureRecognizer *) tapGesture{
    UIImageView *tmp = (UIImageView*)tapGesture.view;//tmp la anh hien tai
    [tapGesture.view removeFromSuperview];
    [self.view addSubview:tmp];
    if (_ok)//neu lat 1 anh
    {
        [UIImageView transitionWithView : tmp
                          duration :  0.5
                           options : UIViewAnimationOptionTransitionFlipFromRight
                         animations:^{
                             tmpView.image = [UIImage imageNamed:@"Pokemon.jpg"];
                             int m = tmp.tag;
                             UIImageView *view = [_arrView1 objectAtIndex:m];
                             tmp.image = view.image;
                             tmpView = tmp;
                             [tmp removeFromSuperview];
                             [self.view addSubview:tmpView];

                         } completion:^(BOOL finished){
                             _ok = NO;
                         }];
    }
    else
    {
        //tmpView.image = [UIImage imageNamed:@"Pokemon.jpg"];
        int m = tmp.tag;
        UIImageView *view = [_arrView1 objectAtIndex:m];
        tmp.image = view.image;
        if([self compare:tmp.image isEquaTo:tmpView.image]){
            //_ok = YES;//danh dau la chua lat anh
            [UIImageView transitionWithView : tmp
                                   duration :  0.5
                                    options : UIViewAnimationOptionTransitionFlipFromRight
                                  animations:^{
                                      [tmp removeFromSuperview];
                                      [self.view addSubview:tmp];
                                      //[tmpView removeFromSuperview];
                                      dem -= 2;
                                      //tmpView = nil;
                                  } completion:^(BOOL finished){
                                      _ok = YES;
                                      [tmp removeFromSuperview];
                                      [tmpView removeFromSuperview];
                                      tmpView = nil;

                                  }];
        }
        else{
            [UIImageView transitionWithView : tmp
                                   duration :  0.5
                                    options : UIViewAnimationOptionTransitionFlipFromRight
                                  animations:^{
                                      tmpView.image = [UIImage imageNamed:@"Pokemon.jpg"];
                                      int m = tmp.tag;
                                      UIImageView *view = [_arrView1 objectAtIndex:m];
                                      tmp.image = view.image;
                                      tmpView = tmp;
                                      [tmp removeFromSuperview];
                                      [self.view addSubview:tmpView];
                                  } completion:^(BOOL finished){
                                      _ok = NO;
                                  }];
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
