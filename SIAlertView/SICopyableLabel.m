//
//  SICopyableLabel.m
//  SIAlertViewExample
//
//  Created by Sajil on 17/11/16.
//  Copyright © 2016 Sumi Interactive. All rights reserved.
//

#import "SICopyableLabel.h"

@implementation SICopyableLabel

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self sharedInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self sharedInit];
    }
    return self;
}

- (void)sharedInit {
    UILongPressGestureRecognizer *lpGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showMenu:)];
    [self addGestureRecognizer:lpGesture];
}

- (void)showMenu:(id)sender {
    [self becomeFirstResponder];

    UIMenuController *menu = [UIMenuController sharedMenuController];
    if (menu.isMenuVisible == NO) {
        [menu setTargetRect:self.bounds inView:self];
        [menu setMenuVisible:YES animated:YES];
    }
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return action == @selector(copy:);
}

- (void)copy:(id)sender {
    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
    pasteBoard.string = self.text;
    [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
}

@end
