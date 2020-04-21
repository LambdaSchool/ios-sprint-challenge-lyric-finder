//
//  FavoriteArtistsViewController.m
//  FavoriteArtistsSprintChallenge
//
//  Created by Dillon P on 4/19/20.
//  Copyright © 2020 Dillon's Lambda Team. All rights reserved.
//

#import "FavoriteArtistsViewController.h"
#import "Artist.h"
#import "ArtistFetcher.h"

@interface FavoriteArtistsViewController () <UITableViewDataSource, UITableViewDelegate>

// Properties

// IBOutlets
@property (nonatomic) IBOutlet UITableView *tableView;

// Private Methods

@end

@implementation FavoriteArtistsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSFileManager *fileManager = [NSFileManager new];
    NSError *error = nil;
    NSURL *docsURL = [fileManager URLForDirectory:NSDocumentDirectory
                                         inDomain:NSUserDomainMask
                                appropriateForURL:nil
                                           create:YES
                                            error:&error];
    if (!error) {
        NSURL *artistDictionaryURL = [docsURL URLByAppendingPathComponent:@"Artists"];
        NSLog(@"%@", artistDictionaryURL);
        
        if (![fileManager fileExistsAtPath:artistDictionaryURL.path]) {
            [fileManager createDirectoryAtURL:artistDictionaryURL withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error) {
                [self writeToURL:artistDictionaryURL error:&error];
//                NSLog(@"%@", self.artistDictionary);
            }
            if (error) {
                NSLog(@"Error: %@, writing dictionary to path: %@", error, artistDictionaryURL);
            }
            
        } else {
            NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:artistDictionaryURL error:&error];
            NSLog(@"%@", dictionary);
        }
    }
    
    
}


// MARK: - Methods

- (BOOL)writeToURL:(NSURL *)url error:(NSError * _Nullable __autoreleasing *)error
{
    Artist *testArtist = [[Artist alloc] initWithArtistName:@"Test" yearFounded:1999 artistBio:@"This is a test artist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:testArtist, testArtist.artistName, nil];
    
    [dictionary writeToURL:url error:error];
    self.artistDictionary = dictionary;
    [self.tableView reloadData];
    NSLog(@"%@", self.artistDictionary);
    
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// MARK: - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.artistDictionary.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    NSArray *artists = self.artistDictionary.allValues;
    
    Artist *artist = [artists objectAtIndex:indexPath.row];
    cell.textLabel.text = artist.artistName;
    
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
