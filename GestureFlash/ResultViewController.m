//
//  ResultViewController.m
//  GestureFlash
//
//  Created by Takeshi Bingo on 2013/07/27.
//  Copyright (c) 2013年 Takeshi Bingo. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController{
    IBOutlet UILabel *timeLabel;
    IBOutlet UILabel *newHighScoreLabel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    timeLabel.text = [NSString stringWithFormat:@"%.3f秒",_time];
    [self checkHighScore];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) checkHighScore {
    //ハイスコアが更新されかどうかの管理（スコア比較前は「偽」に）
    bool newHighScore = false;
    //一度「ハイスコア更新」ラベルを非表示
    newHighScoreLabel.hidden = true;
    //User Defaultsへアクセスする
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //1位から3位までのハイスコアを取得し、double型の変数に格納
    double highscores1 = [defaults doubleForKey:@"highscore1"];
    double highscores2 = [defaults doubleForKey:@"highscore2"];
    double highscores3 = [defaults doubleForKey:@"highscore3"];
    
    //（全てのハイスコアが既にある場合）比較の結果、今回のtimeが当てはまる順位に記録を挿入
    //1位より早い場合
    if (highscores1 != 0 && _time <= highscores1) {
        highscores3 = highscores2;
        highscores2 = highscores1;
        highscores1 = _time;
        newHighScore = true;
        //2位より早い場合
    } else if (highscores2 != 0 && _time <= highscores2) {
        highscores3 = highscores2;
        highscores2 = _time;
        newHighScore = true;
        //3位より早い場合
    } else if (highscores3 != 0 && _time <= highscores3) {
        highscores3 = _time;
        newHighScore = true;
    }
    //ハイスコアがまだ格納されていない場合の_timeとの比較
    //1位がまだない場合
    else if (highscores1 == 0) {
        highscores1 = _time;
        newHighScore = true;
        //2位がまだなく、1位より遅い場合
    } else if (highscores2 == 0 && _time >= highscores1) {
        highscores2 = _time;
        newHighScore = true;
        //3位がまだなく、2位より遅い場合
    } else if (highscores3 == 0 && _time >= highscores2) {
        highscores3 = _time;
        newHighScore = true;
    }
    //新しいハイスコアをUser Defaultsに保存
    [defaults setDouble:highscores1 forKey:@"highscore1"];
    [defaults setDouble:highscores2 forKey:@"highscore2"];
    [defaults setDouble:highscores3 forKey:@"highscore3"];
    //もし、ハイスコアが更新された場合は「ハイスコア更新」ラベルを表示
    if (newHighScore == true) {
        newHighScoreLabel.hidden = false;
    }
}


@end
