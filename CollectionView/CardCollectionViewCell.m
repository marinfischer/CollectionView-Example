//
//  CardCollectionViewCell.m
//  CollectionView
//
//  Created by Marin Fischer on 12/4/14.
//  Copyright (c) 2014 TheCodeBoutique. All rights reserved.
//

#import "CardCollectionViewCell.h"

@interface CardCollectionViewCell ()
@property (nonatomic, strong, readwrite) UIImageView *imageView;
@property (nonatomic, strong, readwrite) UILabel *insTypeName;

@end

@implementation CardCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 8.0f;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1.0f;
//        self.layer.shadowColor = [UIColor blackColor].CGColor;
//        self.layer.shadowRadius = 3.0f;
//        self.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
//        self.layer.shadowOpacity = 0.5f;
        
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        self.layer.shouldRasterize = YES;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x + 30.0f, self.bounds.origin.y, self.bounds.size.width - 60.0f, self.bounds.size.height - 20.0f)];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.clipsToBounds = YES;
        
        self.insTypeName = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, self.bounds.size.height - 20.0f, self.bounds.size.width, 20.0f)];
        self.insTypeName.clipsToBounds = YES;
        
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.insTypeName];
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.imageView.image = nil;
    self.insTypeName.text = nil;
}

@end
