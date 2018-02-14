//
//  ViewController.m
//  HelloWorldiOS
//
//  Created by Anton Chuev on 2/12/18.
//  Copyright © 2018 Applitools. All rights reserved.
//

#import "ViewController.h"
#import "BEMCheckBox.h"
#import "InitialStrategy.h"
#import "DifferencesStrategy.h"

static int GenerateRandomNumberCheckboxTag = 0xAAAA;
static int SimulateDifferencesCheckboxTag = 0xBBBB;

@interface ViewController () <BEMCheckBoxDelegate>

@property (weak, nonatomic) IBOutlet UILabel *helloLable;

@property (weak, nonatomic) IBOutlet BEMCheckBox *generateRandomNumberCheckbox;
@property (weak, nonatomic) IBOutlet BEMCheckBox *simulateDifferencesCheckbox;

@property (weak, nonatomic) IBOutlet UILabel *randomNumberLabel;
@property (weak, nonatomic) IBOutlet UIButton *clickMeButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *clickMeButtonCenterXLayout;
@property (weak, nonatomic) IBOutlet UILabel *buttonClickedLable;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (assign, nonatomic) BOOL clickMeContentShown;
@property (strong, nonatomic) id <Strategy> currentStrategy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.generateRandomNumberCheckbox.tag = GenerateRandomNumberCheckboxTag;
    self.simulateDifferencesCheckbox.tag = SimulateDifferencesCheckboxTag;
    
    [self updateRandomNumberLable];
    
    self.currentStrategy = [InitialStrategy new];
    self.helloLable.attributedText = [self.currentStrategy attributedText];
    
    self.clickMeContentShown = NO;
    [self showClickMeContent:self.clickMeContentShown];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.clickMeButton.layer.cornerRadius = 5.f;
    [self updateContentWithStrategy:self.currentStrategy];
}

- (void)showClickMeContent:(BOOL)shouldShow {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.buttonClickedLable.hidden = !shouldShow;
        weakSelf.imageView.hidden = !shouldShow;
    });
}

- (void)updateContentWithStrategy:(id<Strategy>)strategy {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.imageView.image = [strategy image];
        weakSelf.clickMeButtonCenterXLayout.constant = [strategy clickMeButtonCenterXLayoutValue];
        weakSelf.helloLable.attributedText = [strategy attributedText];
    });
}

- (NSInteger)generateRandomInteger {
    return rand()%NSIntegerMax+1;
}

- (void)updateRandomNumberLable {
    NSInteger randomInteger = [self generateRandomInteger];
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.randomNumberLabel.text = [NSString stringWithFormat:@"%li", (long)randomInteger];
    });
}

#pragma mark

- (IBAction)clickMeButtonTapped:(id)sender {
    self.clickMeContentShown = !self.clickMeContentShown;
    [self showClickMeContent:self.clickMeContentShown];
}

#pragma mark - BEMCheckBoxDelegate

- (void)didTapCheckBox:(BEMCheckBox *)checkBox {
    if ( checkBox.tag == GenerateRandomNumberCheckboxTag ) {
        if ( checkBox.on ) {
            [self updateRandomNumberLable];
        }
    } else {
        if ( checkBox.on ) {
            self.currentStrategy = [self.currentStrategy isKindOfClass:[InitialStrategy class]] ? [DifferencesStrategy new] : [InitialStrategy new];
            [self updateContentWithStrategy:self.currentStrategy];
        } else {
            self.clickMeContentShown = NO;
            [self showClickMeContent:self.clickMeContentShown];
        }
    }
}

@end
