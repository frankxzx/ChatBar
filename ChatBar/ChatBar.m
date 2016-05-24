//
//  ChatBar.m
//  ChatBar
//
//  Created by Xuzixiang on 16/5/23.
//  Copyright © 2016年 TouchSpring. All rights reserved.
//

#import "ChatBar.h"

@interface ChatBar () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIStackView *containView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ChatBar

//代码调用
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadView];
        self.frame = frame;
    }
    return self;
}

//nib文件调用
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadView];
    }
    return self;
}

//初始化设置
-(void)loadView {
    // 1. load the interface
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *className = NSStringFromClass([self class]);
    UIView *view = [[bundle loadNibNamed:className owner:self options:nil] firstObject];
    // 2. add as subview
    [self addSubview:view];
    // 3. allow for autolayout
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    // 4. add constraints to span entire view
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": view}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view": view}]];
}

//xib加载完毕后 设置 调用
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
    
}

@end
