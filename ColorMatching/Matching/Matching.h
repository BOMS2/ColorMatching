//
//  Matching.h
//  ColorMatching
//
//  Created by Winter on 2020/11/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Matching : NSObject

@property (nonatomic) NSArray *allColors;
@property (nonatomic) NSString *allWords;
@property (nonatomic) NSMutableArray *scoreList;


- (instancetype)init;
- (void)addScoreList:(NSNumber *)score;

@end

