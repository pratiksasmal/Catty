//
//  GoNStepsBackBrick.h
//  Catty
//
//  Created by Mattias Rauter on 27.09.12.
//  Copyright (c) 2012 Graz University of Technology. All rights reserved.
//

#import "Brick.h"

@interface Gonstepsbackbrick : Brick

@property (nonatomic, strong) NSNumber *steps;

-(id)initWithNumberOfSteps:(NSNumber*)steps;

@end