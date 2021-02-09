//
//  ViewController.m
//  ColorMatching
//
//  Created by Winter on 2020/11/27.
//

#import "ViewController.h"
#import "Matching.h"
#import "ScoreTableViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questLabel;
@property (weak, nonatomic) IBOutlet UILabel *questNumberLabel;

@property (nonatomic) Matching *randomMatching;
@property (nonatomic) NSInteger countAnswer;
@property (nonatomic) UIColor *randomColor;
@property (nonatomic) double startTime;
@property (nonatomic) double finalScore;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)setup {
    self.matching = [Matching new];
    self.countAnswer = 1;
}

- (void)updateGame {
    if (self.countAnswer == 1) {
        self.startTime = [[NSDate new] timeIntervalSince1970];
    }
    if (self.countAnswer < 6) {
        self.randomMatching = [Matching new];
        self.questLabel.text = self.randomMatching.allWords;
        self.questLabel.hidden = NO;
        [self performSelector:@selector(hideLabel) withObject:nil afterDelay:1];
        self.randomColor = self.matching.allColors[arc4random_uniform((UInt32)self.matching.allColors.count)];
        self.questLabel.textColor = self.randomColor;
        self.questNumberLabel.text = [NSString stringWithFormat:@"%ld 번 문제", (long)self.countAnswer];
    } else if (self.countAnswer == 6) {
        self.finalScore = [[NSDate new] timeIntervalSince1970] - self.startTime;
        [self alert];
    }
}

- (void)alert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"당신의 점수는 ?" message:[NSString stringWithFormat:@"\n%f", self.finalScore] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"다시하기" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self.matching addScoreList:[NSNumber numberWithDouble:self.finalScore]];
        self.countAnswer = 1;
        [self updateGame];
    }];
    [alert addAction:closeAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)colorButtonDidTap:(UIButton *)sender {
    if ([self.randomColor isEqual:self.matching.allColors[sender.tag]]) {
        [self nextQuestion];
    }
}

- (void)hideLabel {
    self.questLabel.hidden = YES;
}

- (void)nextQuestion {
    if (self.countAnswer < 6) {
        self.countAnswer += 1;
        [self updateGame];
    }
}

- (IBAction)showListButton:(id)sender {
    [self performSegueWithIdentifier:@"ScoreSegue" sender:sender];
}

- (IBAction)startButton:(id)sender {
    [self updateGame];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ScoreTableViewController *vc = [segue destinationViewController];
    [vc setMatchingArray:self.matching.scoreList];
}

@end
