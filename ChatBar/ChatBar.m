//
//  ChatBar.m
//  ChatBar
//
//  Created by Xuzixiang on 16/5/23.
//  Copyright © 2016年 TouchSpring. All rights reserved.
//

#import "ChatBar.h"

@interface ChatBar () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) IBOutlet UIView *view;

@end

@implementation ChatBar

- (instancetype)initWithFrame:(CGRect)frame {
   NSBundle *bundle = [NSBundle bundleForClass:[self class]];
   NSString *className = NSStringFromClass([self class]);
    self = [[bundle loadNibNamed:className owner:self options:nil] firstObject];
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        // 1. load the interface
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        // 2. add as subview
        [self addSubview:self.view];
        // 3. allow for autolayout
        [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
        // 4. add constraints to span entire view
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view":self.view}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view":self.view}]];
        
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    self.textView.text = @"233";
    self.textView.delegate = self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (IBAction)sendClick:(UIButton *)sender {
}

- (void)textViewDidChange:(UITextView *)textView
{
    [textView flashScrollIndicators];   // 闪动滚动条
    
    static CGFloat maxHeight = 130.0f;
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size = [textView sizeThatFits:constraintSize];
    if (size.height >= maxHeight)
    {
        size.height = maxHeight;
        textView.scrollEnabled = YES;   // 允许滚动
    }
    else
    {
        textView.scrollEnabled = NO;    // 不允许滚动，当textview的大小足以容纳它的text的时候，需要设置scrollEnabed为NO，否则会出现光标乱滚动的情况
    }
    textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
}

@end
