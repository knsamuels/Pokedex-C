//
//  KNSPokemon.h
//  Pokedex-C
//
//  Created by Kristin Samuels  on 6/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KNSPokemon : NSObject
// copy is to be used with NSString to make it act like a Swift String
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
// primative property does not need a pointer... it is a value type not referance type
@property (nonatomic, copy, readonly) NSString *spritePath;
// let abilities: [String]
@property (nonatomic, copy, readonly) NSArray<NSString *>*abilities;

//(instancetype)
- (KNSPokemon *)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                         spritePath:(NSString *)spritePath
                          abilities:(NSArray<NSString *>*)abilities;
/*
 1) The method type: Class (+) or Instance (-)
 2) Retrun type
 3) Method name (initilizer) with the first parameter's external name
 4) First parameter's type
 5) First parameter's pointer
 6) First parameter's internal name
 7) Second parameter's external name
 8) Second parameter's type
 9) Second parameter's internal name
 10) Third paramerter's external name
 11) Third paramerter's type
 12) Third paramerter's pointer
 13) Third paramerter's inernal name
 14) Fourth paramerter's external name
 15) Fourth paramerter's type
 16) Generic typecasting for the fouth parameter (<>)
 17) Type for the generic typecasrting (NSString)
 18) Pointer to the type for typecasted
 19) Fourth paramerter's pointer
 20) Fourth paramerter's internal name
 21) Semi-colon
 */

@end

@interface KNSPokemon (JSONConvertable)
- (KNSPokemon *)initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary;

@end


NS_ASSUME_NONNULL_END
