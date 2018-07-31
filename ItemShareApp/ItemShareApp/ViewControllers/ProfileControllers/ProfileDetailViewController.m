//
//  ProfileDetailViewController.m
//  item-share-app
//
//  Created by Tarini Singh on 7/27/18.
//  Copyright © 2018 FBU-2018. All rights reserved.
//

#import "ProfileDetailViewController.h"

@interface ProfileDetailViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *line2;
@property (weak, nonatomic) IBOutlet UIView *line3;
@property (weak, nonatomic) IBOutlet UIView *line4;
@property (weak, nonatomic) IBOutlet UIView *line6;
@property (weak, nonatomic) IBOutlet UIView *line7;
@property (weak, nonatomic) IBOutlet UIView *line8;
@property (weak, nonatomic) IBOutlet UIView *line1;
@property (weak, nonatomic) IBOutlet UIView *line5;

@property (strong,nonatomic) UIImage *cameraPicture;

@end

@implementation ProfileDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.firstNameLabel.text = [NSString stringWithFormat:@"First Name: %@", self.user.firstName];
    self.lastNameLabel.text = [NSString stringWithFormat:@"Last Name: %@", self.user.lastName];
    self.emailLabel.text = [NSString stringWithFormat:@"Email: %@", self.user.email];
    self.numberLabel.text = [NSString stringWithFormat:@"Phone: %@", self.user.phoneNumber];
    
    [self setUpUI];
}

- (void)viewDidAppear:(BOOL)animated{
    [self setUpUI];
}

- (void)setUpUI {
    self.profilePicture.layer.cornerRadius = 37;
    self.profilePicture.clipsToBounds = YES;
    
    self.view4.layer.borderWidth = 1;
    self.view4.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.view4.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:.1f].CGColor;
    
    
    self.line1.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:.1f].CGColor;
    self.line2.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:.1f].CGColor;
    self.line3.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:.1f].CGColor;
    self.line4.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:.1f].CGColor;
    self.line5.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:.1f].CGColor;
    self.line6.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:.1f].CGColor;
    self.line7.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:.1f].CGColor;
    self.line8.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:.1f].CGColor;
}

//update user profile information
- (IBAction)doneButtonPressed:(id)sender {
    PFUser *user = [PFUser currentUser];
    if(self.cameraPicture != nil){
        user[@"profile_image"] = [self getPFFileFromImage:self.cameraPicture];
    }
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(error){
            NSLog(@"error");
        }
        else{
            NSLog(@"success");
        }
    }];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)pictureDone{
    PFUser *user = [PFUser currentUser];
    if(self.cameraPicture != nil){
        user[@"profile_image"] = [self getPFFileFromImage:self.cameraPicture];
    }
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(error){
            NSLog(@"error");
        }
        else{
            NSLog(@"success");
            [self setUpUI];
        }
    }];
}

- (PFFile *)getPFFileFromImage: (UIImage * _Nullable)image {
    // check if image is not nil
    if (!image) {
        return nil;
    }
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    return [PFFile fileWithName:@"image.png" data:imageData];
}

- (IBAction)choosePictureButtonPressed:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (IBAction)takePictureButtonPressed:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera not available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // Get the image captured by the UIImagePickerController
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    self.cameraPicture = editedImage;
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenWidth = screenSize.width;
    self.cameraPicture = [self resizeImage:self.cameraPicture withSize:CGSizeMake(screenWidth, screenWidth)];
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
    [self pictureDone];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
