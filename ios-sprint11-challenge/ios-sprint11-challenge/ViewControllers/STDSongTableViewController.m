//
//  STDSongTableViewController.m
//  ios-sprint11-challenge
//
//  Created by De MicheliStefano on 05.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import "STDSongTableViewController.h"
#import "STDSongController.h"
#import "STDSong.h"
#import "STDSongDetailViewController.h"

@interface STDSongTableViewController ()

@end

@implementation STDSongTableViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _songController = [[STDSongController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _songController = [[STDSongController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.songController fetchSongsFromLocalStore:^(NSError * error)
    {
        if (error) {
            NSLog(@"Error fetching songs from local store.");
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.songController songs] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    STDSong *song = [self.songController songs][indexPath.row];
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowSongDetail"]) {
        STDSongDetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        STDSong *song = [self.songController songs][indexPath.row];
        detailVC.song = song;
        detailVC.songController = self.songController;
        
    } else if ([segue.identifier isEqualToString:@"ShowNewSongDetail"]) {
        STDSongDetailViewController *detailVC = [segue destinationViewController];
        detailVC.songController = self.songController;
    }
}

@end
