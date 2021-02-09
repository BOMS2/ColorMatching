//
//  ScoreTableViewController.m
//  ColorMatching
//
//  Created by Winter on 2020/11/30.
//

#import "ScoreTableViewController.h"
#import "Matching.h"
#import "ScoreTableViewCell.h"
#import "ViewController.h"


@interface ScoreTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray *sortedArray;
@property (nonatomic) NSArray *medalArray;
@property (nonatomic) NSString *medal;

@end


@implementation ScoreTableViewController

@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)setup {
    self.sortedArray = [self.matchingArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    self.medalArray = @[@"🥇", @"🥈", @"🥉"];
    self.medal = @"🏅";
}

- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.matchingArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
    long cellIndex = indexPath.row + 1;
    self.medal = (1 <= cellIndex && cellIndex <= 3) ? self.medalArray[cellIndex - 1] : self.medal;
    cell.rankLabel.text = [NSString stringWithFormat:@"%@ %ld등", self.medal, cellIndex];
    cell.scoreLabel.text = [NSString stringWithFormat:@"%@", [self.sortedArray objectAtIndex:indexPath.row]];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    return footerView;
}

@end
