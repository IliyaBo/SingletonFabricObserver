//
//  ViewController.m
//  App1706
//
//  Created by iOS-School-1 on 17.06.17.
//  Copyright © 2017 Learning. All rights reserved.
//

#import "ViewController.h"
#import "Singleton.h"
#import "Button.h"
#import "Observer.h"

@interface ViewController ()<ObserverProtocol>
@property (nonatomic, strong) UIView *imageView;
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@property (nonatomic, strong) UIButton *button4;
@property (nonatomic) CGRect rectangle;

@property (nonatomic, strong) UIButton *button5;
@property (nonatomic, strong) UIButton *button6;

@property (nonatomic, strong) Observer *observer;

@end

@implementation ViewController

-(void)dealloc{
    [_observer removeAllObservers];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Singleton sharedInstsnce];
    
    self.button1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 100, 50)];
    _button1.backgroundColor = [UIColor blackColor];
    [_button1 setTitle:@"Исчезнуть" forState:UIControlStateNormal];
    
    Button *addButton = [Button buttonWithType:ButtonTypeRemove];
    [addButton draw];
    [addButton size];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observe:) name:nil object:nil];
    self.observer = [Observer new];
    [_observer addObserver:self forEvent:EventTypeAddItem];
    [_observer addObserver:self forEvent:EventTypeRemoveItem];
   
    
    self.button2 = [[UIButton alloc] initWithFrame:CGRectMake(150, 20, 100, 50)];
    _button2.backgroundColor = [UIColor redColor];
    [_button2 setTitle:@"Появиться" forState:UIControlStateNormal];
    
    [self.view addSubview:_button1];
    [self.view addSubview:_button2];
    
    self.button3 = [[UIButton alloc] initWithFrame:CGRectMake(10, 90, 100, 50)];
    _button3.backgroundColor = [UIColor blackColor];
    [_button3 setTitle:@"Уехать" forState:UIControlStateNormal];
    
    self.button4 = [[UIButton alloc] initWithFrame:CGRectMake(150, 90, 100, 50)];
    _button4.backgroundColor = [UIColor redColor];
    [_button4 setTitle:@"Приехать" forState:UIControlStateNormal];
    
    [self.view addSubview:_button3];
    [self.view addSubview:_button4];
    
    self.button5 = [[UIButton alloc] initWithFrame:CGRectMake(10, 160, 100, 50)];
    _button5.backgroundColor = [UIColor blackColor];
    [_button5 setTitle:@"Крутим" forState:UIControlStateNormal];
    
    self.button6 = [[UIButton alloc] initWithFrame:CGRectMake(150, 160, 100, 50)];
    _button6.backgroundColor = [UIColor redColor];
    [_button6 setTitle:@"Стоп" forState:UIControlStateNormal];
    
    [self.view addSubview:_button5];
    [self.view addSubview:_button6];
    
    
    self.rectangle = CGRectMake(150, 450, 100, 100);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextFillRect(context, _rectangle);
    
    self.imageView  = [[UIView alloc] initWithFrame:_rectangle];
    _imageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_imageView];
    
    [_button1 addTarget:self action:@selector(butt1_:) forControlEvents:UIControlEventTouchUpInside];
    [_button1 addTarget:self action:@selector(butt1Observer:) forControlEvents:UIControlEventTouchUpInside];
    
    [_button3 addTarget:self action:@selector(butt3:) forControlEvents:UIControlEventTouchUpInside];
    [_button4 addTarget:self action:@selector(butt4:) forControlEvents:UIControlEventTouchUpInside];
    
    [_button5 addTarget:self action:@selector(butt5:) forControlEvents:UIControlEventTouchUpInside];
    [_button6 addTarget:self action:@selector(butt6:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)butt1Observer:(UIButton *)sender{
    [_observer sendEvent:EventTypeAddItem];
    [_observer sendEvent:EventTypeAddItem];
    [_observer sendEvent:EventTypeRemoveItem];
}

- (void)observe:(NSNotification *)notification{
    NSLog(@"%@", notification.description);
}

- (void)didReceiveEvent:(EventType)type{
    NSLog(@" Уведомление ");
}

- (IBAction)butt1_:(id)sender{
    [Singleton sharedInstsnce];
}

- (IBAction)butt1:(id)sender{
    [UIView transitionWithView:_imageView
                      duration:0.4
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _imageView.alpha = 0.0;
                    }
                    completion:NULL];
}

- (IBAction)butt2:(id)sender{
    [UIView transitionWithView:_imageView
                      duration:0.4
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _imageView.alpha = 1.0;
                    }
                    completion:NULL];
}

- (IBAction)butt3:(id)sender{
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @180;
    animation.toValue = @300;
    animation.duration = 1;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [_imageView.layer addAnimation:animation forKey:@"basic"];
    
    _imageView.layer.position = CGPointMake(300,500);
    
    //    [UIView transitionWithView:_imageView
    //                      duration:1
    //                       options:UIViewAnimationOptionTransitionCrossDissolve
    //                    animations:^{
    //                        _imageView.center = CGPointMake(180, 600);
    //                    }
    //                    completion:NULL];
}

- (IBAction)butt4:(id)sender{
    [UIView transitionWithView:_imageView
                      duration:1
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _imageView.center = CGPointMake(180, 500);
                    }
                    completion:NULL];
}

- (IBAction)butt5:(id)sender{
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    //orbit.path = CFAutorelease(CGPathCreateWithRect(_imageView, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    orbit.removedOnCompletion = NO;
    
    
    
    [_imageView.layer addAnimation:orbit forKey:@"orbit"];
}

- (IBAction)butt6:(id)sender{
    CGRect rect = [[_imageView.layer presentationLayer] frame];
    
    [_imageView.layer removeAnimationForKey:@"orbit"];
    _imageView.frame = rect;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
