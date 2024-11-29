//
//  LyricTableController.m
//  Lyric Finder
//
//  Created by Lotanna Igwe-Odunze on 3/1/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

#import "LyricTableController.h"
#import "LyricsController.h"
#import "SearchViewController.h"

@interface LyricTableController ()

@property LyricsController *lyricsController;

@end

@implementation LyricTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lyricsController = [[LyricsController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lyricsController.lyrics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
    
    LyricModel *lyrics = [self.lyricsController.lyrics objectAtIndex: indexPath.row];
    
    [cell.textLabel setText: lyrics.song];
    [cell.detailTextLabel setText: lyrics.musician];
    
    return cell;
}

//Allow Swipe to Delete
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //If there's a swipe to delete...
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //Delete the lyric from the array
        [self.lyricsController deleteLyrics: indexPath];
        
        //Delete the row from the table view.
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"newSegue"]) {
        
        SearchViewController *destinationVC = segue.destinationViewController;
        
        destinationVC.lyricsController = self.lyricsController;
        
    } else if ([segue.identifier isEqualToString:@"viewSegue"]) {
        
        SearchViewController *destinationVC = segue.destinationViewController;
        
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        LyricModel *lyrics = self.lyricsController.lyrics[indexPath.row];
        
        destinationVC.lyricsController = self.lyricsController;
        
        destinationVC.currentLyrics = lyrics;
    }
}


@end
