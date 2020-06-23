//
//  KNSPokemonController.h
//  Pokedex-C
//
//  Created by Kristin Samuels  on 6/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KNSPokemon.h"
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface KNSPokemonController : NSObject

// static fun fetchPokemon(searchTerm: String, completion: (KNSPokemon) -> Void)
+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^) (KNSPokemon *))completion;

+ (void)fetchImageForPokemon:(KNSPokemon *)pokemon completion:(void (^) (UIImage *))completion;

@end

NS_ASSUME_NONNULL_END
