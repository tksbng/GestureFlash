//
//  ViewController.m
//  GestureFlash
//
//  Created by Takeshi Bingo on 2013/07/27.
//  Copyright (c) 2013年 Takeshi Bingo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    IBOutlet UILabel *highscore1_label;
    IBOutlet UILabel *highscore2_label;
    IBOutlet UILabel *highscore3_label;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double highscores1 = [defaults doubleForKey:@"highscore1"];
    double highscores2 = [defaults doubleForKey:@"highscore2"];
    double highscores3 = [defaults doubleForKey:@"highscore3"];
    NSLog(@"ハイスコア：１位- %f ２位- %f ３位- %f",highscores1,highscores2,highscores3);
    if (highscores1 != 0) {
        highscore1_label.text = [NSString stringWithFormat:@"%.3f 秒",highscores1];
    }
    if (highscores2 != 0) {
        highscore2_label.text = [NSString stringWithFormat:@"%.3f 秒",highscores2];
    }
    if (highscores3 != 0) {
        highscore3_label.text = [NSString stringWithFormat:@"%.3f 秒",highscores3];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
