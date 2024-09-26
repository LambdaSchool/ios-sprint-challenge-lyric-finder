//
//  CGALyricsTableViewController.m
//  ios-lyric-finder
//
//  Created by Conner on 10/5/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "CGALyricsTableViewController.h"
#import "CGASongController.h"
#import "CGALyricDetailViewController.h"

@interface CGALyricsTableViewController ()

@end

@implementation CGALyricsTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
//    [[self songController] loadSongsFromDocuments];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        _songController = [[CGASongController alloc] init];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
       _songController = [[CGASongController alloc] init];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self songController] songs] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    NSArray *songs = [[self songController] songs];
    [[cell textLabel] setText:[[songs objectAtIndex:[indexPath row]] song]];
    [[cell detailTextLabel] setText:[[songs objectAtIndex:[indexPath row]] artist]];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CGALyricDetailViewController *vc = [segue destinationViewController];
    if ([vc isKindOfClass:[CGALyricDetailViewController class]]) {
        [vc setSongController:[self songController]];
        if ([[segue identifier] isEqualToString:@"ShowSongLyricsSegue"]) {
            NSIndexPath *index = [[self tableView] indexPathForSelectedRow];
            CGASong *song = [[[self songController] songs] objectAtIndex:[index row]];
            [vc setSong:song];
        }
    }
}


@end
