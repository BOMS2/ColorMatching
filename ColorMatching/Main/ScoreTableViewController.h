//
//  ScoreTableViewController.h
//  ColorMatching
//
//  Created by Winter on 2020/11/30.
//

#import <UIKit/UIKit.h>


@interface ScoreTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray *matchingArray;

@end
