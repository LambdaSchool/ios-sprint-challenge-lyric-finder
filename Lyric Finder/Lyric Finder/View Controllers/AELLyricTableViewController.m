//
//  AELLyricTableViewController.m
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import "AELLyricTableViewController.h"
#import "AELSongController.h"
#import "AELSong.h"
#import "AELDetailViewController.h"

@interface AELLyricTableViewController ()
@property AELSongController *songController;
@end

@implementation AELLyricTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   _songController = [[AELSongController alloc] init];
    [[self songController] loadFromPersistentFile];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[[self songController] songs] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    AELSong *song = [[[self songController] songs] objectAtIndex:indexPath.row];
    [[cell textLabel] setText: [song title]];
    [[cell detailTextLabel] setText: [song artist]];
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    AELDetailViewController *destinationVC = (AELDetailViewController *)[segue destinationViewController];
    
    if ([[segue identifier] isEqualToString:@"AddLyric"]){
        [destinationVC setSongController: [self songController]];
    } else {
        [destinationVC setSongController: [self songController]];
        NSInteger index = [[[self tableView] indexPathForSelectedRow] row];
        AELSong *song = [[[self songController] songs]objectAtIndex: index];
        [destinationVC setSong: song];
    }
}


@end
