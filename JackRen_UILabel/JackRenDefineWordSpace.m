//
//  JackRenDefineWordSpace.m
//  ZHBWorker
//
//  Created by JackRen on 16/6/28.
//  Copyright © 2016年 atense. All rights reserved.
//

#import "JackRenDefineWordSpace.h"

#define DEFINELABELTEXTCOLOR [UIColor colorWithRed:25/255.0 green:153/255.0 blue:253/255.0 alpha:1.0]

@interface JackRenDefineWordSpace() {
    NSString *_charterString;
    CGFloat _labelWidth;
    CGFloat _myFont;
    CGFloat _singleWidth;
    CGFloat _marginLeft;
}

@property (nonatomic,strong) UILabel *firstLabel;
@property (nonatomic,strong) UILabel *lastLabel;

@property (nonatomic,strong) UILabel *centerLabel;

@end

@implementation JackRenDefineWordSpace


- (instancetype)initWithString:(NSString *)LabelString defineFont:(CGFloat)font WithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _charterString = LabelString;
        _labelWidth = CGRectGetWidth(self.frame);
        _myFont = font;
        _singleWidth =font;// _labelWidth/(_charterString.length + _charterString.length - 1);
        _marginLeft = (_labelWidth - _singleWidth*_charterString.length)/(_charterString.length - 1);
        [self configView];
    }
    return self;
}

- (void)configView {
    if (_charterString.length == 1) {
        [self addSubview:self.centerLabel];
    }else if (_charterString.length == 2) {
        [self addSubview:self.firstLabel];
        [self addSubview:self.lastLabel];
    }else {
        [self addSubview:self.firstLabel];
        [self addSubview:self.lastLabel];
        for (int i = 0; i < _charterString.length - 2; i++) {
            UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.firstLabel.frame) + (_singleWidth*i + _marginLeft*i + _marginLeft), 0, _singleWidth, CGRectGetHeight(self.frame))];
            myLabel.text = [_charterString substringWithRange:NSMakeRange(i + 1, 1)];
            myLabel.font = [UIFont systemFontOfSize:_myFont];
            myLabel.textAlignment = NSTextAlignmentCenter;
            myLabel.textColor = DEFINELABELTEXTCOLOR;
            [self addSubview:myLabel];
        }
    }
}


- (UILabel *)firstLabel {
    if (!_firstLabel) {
        self.firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _singleWidth, CGRectGetHeight(self.frame))];
        _firstLabel.text = [_charterString substringToIndex:1];
        _firstLabel.textAlignment = NSTextAlignmentLeft;
        _firstLabel.font = [UIFont systemFontOfSize:_myFont];
        _firstLabel.textColor = DEFINELABELTEXTCOLOR;
    }
    return _firstLabel;
}


- (UILabel *)lastLabel {
    if (!_lastLabel) {
        self.lastLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - _singleWidth, 0, _singleWidth, CGRectGetHeight(self.frame))];
        _lastLabel.textColor = DEFINELABELTEXTCOLOR;
        _lastLabel.font = [UIFont systemFontOfSize:_myFont];
        _lastLabel.textAlignment = NSTextAlignmentRight;
        _lastLabel.text = [_charterString substringFromIndex:_charterString.length-1];
    }
    return _lastLabel;
}


- (UILabel *)centerLabel {
    if (!_centerLabel) {
        self.centerLabel = [[UILabel alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.frame) - _singleWidth)/2, 0, _singleWidth, CGRectGetHeight(self.frame))];
        _centerLabel.text = _charterString;
        _centerLabel.font = [UIFont systemFontOfSize:_myFont];
        _centerLabel.textAlignment = NSTextAlignmentCenter;
        _centerLabel.textColor = DEFINELABELTEXTCOLOR;
    }
    return _centerLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
