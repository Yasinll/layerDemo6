//
//  ViewController.m
//  layerDemo6
//
//  Created by PatrickY on 2018/3/13.
//  Copyright © 2018年 PatrickY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView     *layerView;
@property (nonatomic) CALayer                   *blueLayer;
@property (nonatomic) UIAlertController         *alertVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(130.0f, 300.0f, 100.0f, 100.0f);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    [self.layerView.layer addSublayer:self.blueLayer];
 
    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//
//    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
//
//    if ([self.layerView.layer containsPoint:point] ) {
//
//        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
//
//    }
//
//    if ([self.blueLayer containsPoint:point]) {
//        _alertVC = [UIAlertController alertControllerWithTitle:@"点击了蓝色layer" message:nil preferredStyle:UIAlertControllerStyleAlert];
//
//    }else {
//        _alertVC = [UIAlertController alertControllerWithTitle:@"点击了白色的layer" message:nil preferredStyle:UIAlertControllerStyleAlert];
//        }
//
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"取消");
//
//    }];
//
//        [_alertVC addAction:action];
//
//        [self presentViewController:_alertVC animated:YES completion:nil];
//
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPoint potin = [[touches anyObject] locationInView:self.layerView];//1self.view
    
    CALayer *touchedLayer = [self.layerView.layer hitTest:potin];
    
    if (touchedLayer == self.blueLayer) {
        _alertVC = [UIAlertController alertControllerWithTitle:@"点击了蓝色layer" message:nil preferredStyle:UIAlertControllerStyleAlert];
    }else if (touchedLayer == self.layerView.layer) {
        _alertVC = [UIAlertController alertControllerWithTitle:@"点击了白色的layer" message:nil preferredStyle:UIAlertControllerStyleAlert];
    }
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    
    [_alertVC addAction:action];
    
    [self presentViewController:_alertVC animated:YES completion:nil];
    
}


@end
