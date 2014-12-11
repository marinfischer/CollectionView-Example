//
//  CardTransitionManager.m
//  CollectionView
//
//  Created by Marin Fischer on 12/10/14.
//  Copyright (c) 2014 TheCodeBoutique. All rights reserved.
//

#import "CardTransitionManager.h"
#import "CardLayoutView.h"

@interface CardTransitionManager()
@property (nonatomic) CardLayoutView *transitionLayout;
@property (nonatomic) id <UIViewControllerContextTransitioning> context;

@end

@implementation CardTransitionManager

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
{
    self = [super init];
    if (self != nil)
    {
        self.collectionView = collectionView;
    }
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

}

//transition between card categories and individual cards
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

////sets up and starts viewcontroller animation
//- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext
//{
//    self.context = transitionContext;
//    
//    UICollectionViewController *fromCollectionViewController =
//    (UICollectionViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UICollectionViewController *toCollectionViewController =
//    (UICollectionViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    
//    UIView *containerView = [transitionContext containerView];
//    [containerView addSubview:[toCollectionViewController view]];
//    
//    self.transitionLayout = (CardTransitionLayout *)[fromCollectionViewController.collectionView startInteractiveTransitionToCollectionViewLayout:toCollectionViewController.collectionViewLayout completion:^(BOOL didFinish, BOOL didComplete) {
//        [self.context completeTransition:didComplete];
//        self.transitionLayout = nil;
//        self.context = nil;
//        self.hasActiveInteraction = NO;
//    }];
//}

//- (void)updateWithProgress:(CGFloat)progress andOffset:(UIOffset)offset
//{
//    if (self.context != nil &&  // we must have a valid context for updates
//        ((progress != self.transitionLayout.transitionProgress) || !UIOffsetEqualToOffset(offset, self.transitionLayout.offset)))
//    {
//        [self.transitionLayout setOffset:offset];
//        [self.transitionLayout setTransitionProgress:progress];
//        [self.transitionLayout invalidateLayout];
//        [self.context updateInteractiveTransition:progress];
//    }
//}
//
//- (void)endInteractionWithSuccess:(BOOL)success
//{
//    if (self.context == nil)
//    {
//        self.hasActiveInteraction = NO;
//    }
//    // allow for the transition to finish when it's progress has started as a threshold of 10%,
//    // if you want to require the pinch gesture with a wider threshold, change it it a value closer to 1.0
//    //
//    else if ((self.transitionLayout.transitionProgress > 0.1) && success)
//    {
//        [self.collectionView finishInteractiveTransition];
//        [self.context finishInteractiveTransition];
//    }
//    else
//    {
//        [self.collectionView cancelInteractiveTransition];
//        [self.context cancelInteractiveTransition];
//    }
//}
@end
