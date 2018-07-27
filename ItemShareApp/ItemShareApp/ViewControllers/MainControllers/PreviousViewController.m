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
@property PlaceholdViewController *placeholdViewController;

@end

//map rename
@implementation PreviousViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y +201, self.searchView.frame.size.width, self.searchView.frame.size.height);
    // Do any additional setup after loading the view.
}

- (IBAction)swipeDown:(id)sender {
    [self dismissToMap];
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (IBAction)swipeUp:(id)sender {
    if(self.searchView.frame.origin.y == 613)
    {
        [UIView animateWithDuration:0.5 animations:^{self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y -263, self.searchView.frame.size.width, self.searchView.frame.size.height);
        }];
    }
    if(self.searchView.frame.origin.y == 350)
    {
        [UIView animateWithDuration:0.5 animations:^{self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y -201, self.searchView.frame.size.width, self.searchView.frame.size.height);
        }];
    }
}

- (void)dismissToMap {
    if(self.searchView.frame.origin.y == 350)
    {
        [UIView animateWithDuration:0.5 animations:^{self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y +263, self.searchView.frame.size.width, self.searchView.frame.size.height);
        }];
    }
    if(self.searchView.frame.origin.y == 149)
    {
        [UIView animateWithDuration:0.5 animations:^{self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y +201, self.searchView.frame.size.width, self.searchView.frame.size.height);
        }];
    }
    [self.view endEditing:YES];
}

- (void)showSearchView {
    if(self.searchView.frame.origin.y == 613)
    {
        [UIView animateWithDuration:0.5 animations:^{self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y -464, self.searchView.frame.size.width, self.searchView.frame.size.height);
        }];
    }
    
    if(self.searchView.frame.origin.y == 350)
    {
        [UIView animateWithDuration:0.5 animations:^{self.searchView.frame = CGRectMake(self.searchView.frame.origin.x, self.searchView.frame.origin.y -201, self.searchView.frame.size.width, self.searchView.frame.size.height);
        }];
    }
    [self.placeholdViewController.searchBar becomeFirstResponder];
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
        self.placeholdViewController = placeholdViewController;
    }
    if([segue.identifier isEqualToString:@"mapSegue"]){
        self.mapController = [segue destinationViewController];
    }
}


- (void)addAnnotationsInMap:(NSMutableArray*)filteredItemArray {
    [self.mapController addAnnotations:filteredItemArray];
}

- (void)removeAnnotationsInMap{
    [self.mapController removeAllPinsButUserLocation];
}


@end
