//
//  PreviousViewController.m
//  item-share-app
//
//  Created by Stephanie Lampotang on 7/18/18.
//  Copyright © 2018 FBU-2018. All rights reserved.
//

#import "PreviousViewController.h"
#import "CategoriesViewController.h"
#import "PlaceholdViewController.h"
#import "MapViewController.h"

@interface PreviousViewController ()
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (strong, nonatomic ) MapViewController *mapController;

@end

//map rename
@implementation PreviousViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y +464, self.searchView.frame.size.width, self.searchView.frame.size.height);
    // Do any additional setup after loading the view.
}

- (IBAction)swipeDown:(id)sender {
    if(self.searchView.frame.origin.y == 149)
    {
        [UIView animateWithDuration:1.0 animations:^{self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y +464, self.searchView.frame.size.width, self.searchView.frame.size.height);
        }];
    }
}

- (IBAction)swipeUp:(id)sender {
    if(self.searchView.frame.origin.y == 613)
    {
        [UIView animateWithDuration:1.0 animations:^{self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y -464, self.searchView.frame.size.width, self.searchView.frame.size.height);
        }];
    }
}

- (void)dismissToMap {
    if(self.searchView.frame.origin.y == 149)
    {
        [UIView animateWithDuration:1.0 animations:^{self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y +464, self.searchView.frame.size.width, self.searchView.frame.size.height);
        }];
        NSLog(@"%f", self.searchView.frame.origin.y);
    }
    //self.searchView.alpha = 0;
    // Do any additional setup after loading the view.
}

- (void)showSearchView {
    if(self.searchView.frame.origin.y == 613)
    {
        [UIView animateWithDuration:1.0 animations:^{self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y -464, self.searchView.frame.size.width, self.searchView.frame.size.height);
        }];
        NSLog(@"origin y coord of the search view after its raised: ");
        NSLog(@"%f", self.searchView.frame.origin.y);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if([segue.identifier isEqualToString:@"showSearchViewSegue"])
    {
        PlaceholdViewController *placeholdViewController = [segue destinationViewController];
        placeholdViewController.placeholderDelegate = self;
        placeholdViewController.placeholderDelegateMap = self;
    }
    if([segue.identifier isEqualToString:@"mapSegue"]){
        self.mapController = [segue destinationViewController];
    }
}

- (void)test1{
    NSLog(@"test1");
}

- (void)addAnnotationsInMap:(NSMutableArray*)filteredItemArray {
    [self.mapController addAnnotations:filteredItemArray];
}

- (void)removeAnnotationsInMap{
    [self.mapController removeAllPinsButUserLocation];
}


@end