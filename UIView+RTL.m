//
//  UIView+RTL.m
//  Sporte
//
//  Created by Adi Shua on 12/22/12.
//
//

#import "UIView+RTL.h"

@implementation UIView(RTL)

-(void)makeRTL {
    Boolean special = NO;
    
    if([self.class isSubclassOfClass:UIButton.class]) {
        special = YES;
    }
    
    if([[self class]isSubclassOfClass:[UILabel class]]) {
        UILabel *label = (UILabel *) self;
        [label setTextAlignment:NSTextAlignmentRight];
    }
    
    if(special || [self subviews].count == 0) {
        CGRect frame =  self.frame;
        
        frame = [self frameToRTL:self];
        [self setFrame:frame];
    }
    
    for (UIView *view  in [self subviews]) {
        [view makeRTL];
    }
}

-(CGRect) frameToRTL:(UIView *)view {
    CGRect frame = view.frame;
    CGRect superViewFrame = [view superview].frame;
    
    return CGRectMake(superViewFrame.size.width - frame.origin.x - frame.size.width, frame.origin.y, frame.size.width, frame.size.height);
}

@end
