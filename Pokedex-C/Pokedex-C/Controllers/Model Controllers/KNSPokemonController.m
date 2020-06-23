//
//  KNSPokemonController.m
//  Pokedex-C
//
//  Created by Kristin Samuels  on 6/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import "KNSPokemonController.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2";
static NSString * const pokemonComponent = @"pokemon";


@implementation KNSPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(KNSPokemon * _Nullable))completion
{
    // baseURL = https://pokeapi.com/api/v2
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    //pokemonURL =https://pokeapi.com/api/v2/pokemon
    NSURL *pokemonURL = [baseURL URLByAppendingPathComponent:pokemonComponent];
    //finalURL = https://pokeapi.com/api/v2/pokemon/butterfree
    NSURL *finalURL = [pokemonURL URLByAppendingPathComponent:searchTerm];
    
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error fetching the pokemon: %@, %@", error, [error localizedDescription]);
           return completion(nil); // must change Nullable in function
           
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error: &error];
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the data: %@", error);
                return completion(nil);
            }
            
            KNSPokemon *pokemon = [[KNSPokemon alloc] initWithDictionary:topLevelDictionary];
            completion(pokemon);
        }
    }] resume];
}

+ (void)fetchImageForPokemon:(KNSPokemon *)pokemon completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *finalURL = [NSURL URLWithString:pokemon.spritePath];
    
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", [error localizedDescription]);
            return completion(nil);
        }
        if (data)
        {
            UIImage *pokemonImage = [UIImage imageWithData:data];
            
            if (!pokemonImage)
            {
                NSLog(@"We were unable to turn our data into an image");
                return completion(nil);
            }
            completion(pokemonImage);
        }
    }] resume];
}


@end
