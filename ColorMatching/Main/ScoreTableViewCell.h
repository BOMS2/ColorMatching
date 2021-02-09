//
//  ScoreTableViewCell.h
//  ColorMatching
//
//  Created by Winter on 2020/11/30.
//

#import <UIKit/UIKit.h>


@interface ScoreTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;

@end
