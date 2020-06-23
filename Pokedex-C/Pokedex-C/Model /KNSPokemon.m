//
//  KNSPokemon.m
//  Pokedex-C
//
//  Created by Kristin Samuels  on 6/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import "KNSPokemon.h"

@implementation KNSPokemon

- (KNSPokemon *)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier spritePath:(NSString *)spritePath abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    // same as writing self
    if (self != nil)
    {
        _name = name;
        _identifier = identifier;
        _spritePath = spritePath;
        _abilities = abilities;
    }
    return self;
}

@end

@implementation KNSPokemon (JSONConvertable)

- (KNSPokemon *)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    //name, ID, abilities, spritePath
    NSString *name = topLevelDictionary[@"name"];
    NSInteger identifier = [topLevelDictionary[@"id"] integerValue];
    NSString *spritePath = topLevelDictionary[@"sprites"][@"front_shiny"];
    NSArray *abilitiesArray = topLevelDictionary[@"abilities"];
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in abilitiesArray)
    {
        NSDictionary *abilityDict = dictionary[@"ability"];
        NSString *abilityName = abilityDict[@"name"];
        [abilities addObject:abilityName];
    }
    
    return [self initWithPokemonName:name identifier:identifier spritePath:spritePath abilities:abilities];
}

@end


