//
//  Matching.m
//  ColorMatching
//
//  Created by Winter on 2020/11/27.
//

#import "Matching.h"


@implementation Matching

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray *array = @[
            UIColor.systemRedColor,
            UIColor.systemYellowColor,
            UIColor.systemGreenColor,
            UIColor.systemBlueColor,
            UIColor.systemOrangeColor,
            UIColor.systemPurpleColor,
            UIColor.blackColor,
            UIColor.brownColor
        ];
        NSArray *allwords = [@"빨강,노랑,파랑,초록,갈색,검정,주황,보라" componentsSeparatedByString:@","];
        self.allColors = array;
        self.allWords = allwords[arc4random_uniform((UInt32)allwords.count)];
        self.scoreList = [NSMutableArray array];
    }
    return self;
}

- (void)addScoreList:(NSNumber *)score {
    [self.scoreList addObject:score];
}

@end
