//
//  CardsCollectionViewController.m
//  CollectionView
//
//  Created by Marin Fischer on 12/4/14.
//  Copyright (c) 2014 TheCodeBoutique. All rights reserved.
//

#import "CardsCollectionViewController.h"
#import "LWInsurancesDAO.h"
#import "InsurancesDataStore.h"
#import "LWInsurancesModel.h"

@interface CardsCollectionViewController ()
@property (nonatomic, strong) NSDictionary *categories;
@property (nonatomic, weak) IBOutlet CardLayoutView *cardCategoryLayout;
@property (nonatomic, strong) NSArray *cards;
@property (nonatomic, strong) NSArray *categoryGroupsArray;
@property (nonatomic, strong) NSArray *healthArray;
@property (nonatomic, strong) NSArray *dentalArray;
@property (nonatomic, strong) NSArray *visionArray;
@property (nonatomic, strong) NSArray *autoArray;
@property (nonatomic, strong) NSArray *homeArray;
@property (nonatomic, strong) NSArray *lifeArray;
@property (nonatomic, strong) NSMutableArray *allCardItems;

@end

@implementation CardsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

-(void)awakeFromNib {
    [super awakeFromNib];
    LWInsurancesDAO *insurancesDAO = [LWInsurancesDAO new];
    [insurancesDAO loadJSONFile];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.categories = [[InsurancesDataStore sharedInstance] insuranceTypesDictionary];
    _categoryGroupsArray = [self.categories allKeys];
    
//    NSUInteger photoCount = arc4random()%4 + 2;

    
    for (NSString *keyName in _categoryGroupsArray) {
    
        if ([keyName isEqualToString:@"Health"]) {
            _healthArray = [_categories valueForKey:keyName];

        }else if ([keyName isEqualToString:@"Dental"]) {
            _dentalArray = [_categories valueForKey:keyName];

        }else if ([keyName isEqualToString:@"Vision"]) {
            _visionArray = [_categories valueForKey:keyName];

        }else if ([keyName isEqualToString:@"Auto"]) {
            _autoArray = [_categories valueForKey:keyName];

        }else if ([keyName isEqualToString:@"Home"]) {
            _homeArray = [_categories valueForKey:keyName];

        }else if ([keyName isEqualToString:@"Life"]) {
            _lifeArray = [_categories valueForKey:keyName];

        }
    }
    
    _allCardItems = [NSMutableArray new];
    [_allCardItems addObject:_healthArray];
    [_allCardItems addObject:_dentalArray];
    [_allCardItems addObject:_visionArray];
    [_allCardItems addObject:_autoArray];
    [_allCardItems addObject:_homeArray];
    [_allCardItems addObject:_lifeArray];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[CardCollectionViewCell class] forCellWithReuseIdentifier:CardCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [_allCardItems count];
}

//will need to update once i get each ins type in its own array
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSArray *cardItems = self.allCardItems[section];
    return cardItems.count;
    
//    NSUInteger numOfItems = 0;
//    for (NSString *keyName in _categoryGroupsArray) {
//        if ([keyName isEqualToString:@"Health"]) {
//            _healthArray = [_categories valueForKey:keyName];
//            numOfItems = [_healthArray count];
//            
//        }else if ([keyName isEqualToString:@"Dental"]) {
//            _dentalArray = [_categories valueForKey:keyName];
//            numOfItems = [_dentalArray count];
//            
//        }else if ([keyName isEqualToString:@"Vision"]) {
//            _visionArray = [_categories valueForKey:keyName];
//            numOfItems = [_visionArray count];
//
//        }else if ([keyName isEqualToString:@"Auto"]) {
//            _autoArray = [_categories valueForKey:keyName];
//            numOfItems = [_autoArray count];
//
//        }else if ([keyName isEqualToString:@"Home"]) {
//            _homeArray = [_categories valueForKey:keyName];
//            numOfItems = [_homeArray count];
//
//        }else if ([keyName isEqualToString:@"Life"]) {
//            _lifeArray = [_categories valueForKey:keyName];
//            numOfItems = [_lifeArray count];
//        }
//    }
//    return numOfItems;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CardCollectionViewCell *cardCell = [collectionView dequeueReusableCellWithReuseIdentifier:CardCellIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSArray *group = self.allCardItems[indexPath.section];
    LWInsurancesModel *card = group[indexPath.item];
    [cardCell.imageView setImage:[UIImage imageNamed:card.imageURL]];
    
    return cardCell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    //get the opposite orientation you want since thise gives you what its currently at before rotation completes
    if (UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])) {
        self.cardLayoutView.numberOfColumns = 3;
        
        // handle insets for iPhone 4 or 5
        CGFloat sideInset = [UIScreen mainScreen].preferredMode.size.width == 1136.0f ?
        45.0f : 25.0f;
        
        self.cardLayoutView.itemInsets = UIEdgeInsetsMake(22.0f, sideInset, 13.0f, sideInset);
        
    } else {
        self.cardLayoutView.numberOfColumns = 2;
        self.cardLayoutView.itemInsets = UIEdgeInsetsMake(22.0f, 22.0f, 13.0f, 22.0f);
    }
}

@end
