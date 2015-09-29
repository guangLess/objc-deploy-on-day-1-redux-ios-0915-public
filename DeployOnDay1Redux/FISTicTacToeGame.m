//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)
        [self resetBoard];
    }

    return self;
}

-(void)resetBoard
{
    [self.board removeAllObjects];
    self.board = [[NSMutableArray alloc] init];
    
    self.board = [ @[ [@[@"", @"", @""] mutableCopy],
                      [@[@"", @"", @""] mutableCopy],
                      [@[@"", @"", @""] mutableCopy]] mutableCopy];
    
    NSLog(@"%@",self.board);

}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSString * player = self.board[column][row];
    return player;
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ([self.board[column][row] isEqualToString:@""]) {
        return YES;
    } else {
        return NO;
    }
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ([self canPlayAtColumn:column row:row]) {
        
        self.board[column][row] = @"x";
    }
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{

    if ([self canPlayAtColumn:column row:row]) {
        
        self.board[column][row] = @"O";
    }
}

-(NSString *)winningPlayer{

    for (NSUInteger i = 0 ; i < 3 ; i++) { // check row ->

        if ([ [self playerAtColumn:0 row:i] isEqualToString:[self playerAtColumn:1 row:i]]  &&
            [ [self playerAtColumn:2 row:i] isEqualToString:[self playerAtColumn:1 row:i]] &&
            (![[self playerAtColumn:0 row:i] isEqualToString:@""])
            ) {

            NSString * sameValue = [self playerAtColumn:0 row:i];
            NSLog(@"here");
            return sameValue;
            }
    
        // check colum ^
            
        if ([ [self playerAtColumn:i row:0] isEqualToString:[self playerAtColumn:i row:1]] &&
            [ [self playerAtColumn:i row:2] isEqualToString:[self playerAtColumn:i row:1]] &&
           (![[self playerAtColumn:i row:0] isEqualToString:@""])
            ) {
            
            NSString * sameValue = [self playerAtColumn:i row:0];
            NSLog(@"here2");
            return sameValue;
        }
        
     }
    
        // check cross x maybe look for simpler number pattern.
            
        if ([ [self playerAtColumn:0 row:0 ] isEqualToString:[self playerAtColumn:(0+1) row:(0+1)]] &&
                [ [self playerAtColumn:0 row:0] isEqualToString:[self playerAtColumn:(0+2) row:(0+2)] ] &&
                (![[self playerAtColumn:0 row:0] isEqualToString:@""])
                ) {
                
            NSString * sameValue = [self playerAtColumn:0 row:0];
            NSLog(@"here3");
                return sameValue;
            }
        
        if ([ [self playerAtColumn:0 row:2 ] isEqualToString:[self playerAtColumn:(0+1) row:(0+1)]] &&
            [ [self playerAtColumn:0 row:2] isEqualToString:[self playerAtColumn:2 row:0] ] &&
            (![[self playerAtColumn:0 row:2] isEqualToString:@""])
            ) {
            
            NSString * sameValue = [self playerAtColumn:0 row:0];
            NSLog(@"here4");
            return sameValue;
        }
          NSLog(@"here5");

    
         return @""; // this is not being called when NO ONE wins.

    }


-(BOOL)isADraw // it seems like this method is called at the same time with winner....  if I want to do [self.board containsObject: @""].
{
   if ([[self winningPlayer] isEqualToString:@""]){
    NSLog(@"board = %@", self.board);
    //return YES;
   }else return NO;
}

@end
