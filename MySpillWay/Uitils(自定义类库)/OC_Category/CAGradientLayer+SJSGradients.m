//
//  CAGradientLayer+SJSGradients.m
//  TestPro
//
//  Created by Arthury on 15/9/17.
//  Copyright (c) 2015年 Arthury. All rights reserved.
//

#import "CAGradientLayer+SJSGradients.h"

@implementation CAGradientLayer (SJSGradients)

+ (CAGradientLayer *)flavescentGradientLayer
{
    UIColor *topColor = [UIColor colorWithRed:1 green:0.92 blue:0.56 alpha:1];
    UIColor *bottomColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

+ (CAGradientLayer *)redGradientLayer{
    UIColor *topColor = [UIColor colorWithRed:1.000 green:0.221 blue:0.022 alpha:1.000];
    UIColor *bottomColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}
+ (CAGradientLayer *)blueGradientLayer{
    UIColor *topColor = [UIColor colorWithRed:0.532 green:0.634 blue:1.000 alpha:1.000];
    UIColor *bottomColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

+ (CAGradientLayer *)turquoiseGradientLayer{
    UIColor *topColor = [UIColor colorWithRed:0.141 green:1.000 blue:0.494 alpha:1.000];
    UIColor *bottomColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

+ (CAGradientLayer *)whiteGradientLayer{
    UIColor *topColor = [UIColor colorWithRed:0.992 green:1.000 blue:0.962 alpha:1.000];
    UIColor *bottomColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

+ (CAGradientLayer *)chocolateGradientLayer{
    UIColor *topColor = [UIColor colorWithRed:0.060 green:0.442 blue:0.226 alpha:1.000];
    UIColor *bottomColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

+ (CAGradientLayer *)tangerineGradientLayer{
    UIColor *topColor = [UIColor colorWithRed:0.584 green:1.000 blue:0.128 alpha:1.000];
    UIColor *bottomColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

+ (CAGradientLayer *)pastelBlueGradientLayer{
    UIColor *topColor = [UIColor colorWithRed:0.175 green:0.259 blue:1.000 alpha:1.000];
    UIColor *bottomColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

+ (CAGradientLayer *)yellowGradientLayer{
    UIColor *topColor = [UIColor colorWithRed:1.000 green:0.954 blue:0.000 alpha:1.000];
    UIColor *bottomColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

+ (CAGradientLayer *)purpleGradientLayer{
    UIColor *topColor = [UIColor colorWithRed:1.000 green:0.308 blue:0.918 alpha:1.000];
    UIColor *bottomColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

+ (CAGradientLayer *)greenGradientLayer{
    UIColor *topColor = [UIColor colorWithRed:0.448 green:1.000 blue:0.620 alpha:1.000];
    UIColor *bottomColor = [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:1];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

+ (CAGradientLayer *)clearGradientLayer{
    UIColor *topColor = [UIColor colorWithWhite:0.000 alpha:0.02];
    UIColor *bottomColor = [UIColor blackColor];
    
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

+ (CAGradientLayer *)clearProGradientLayer{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite: 0.0 alpha:0.0] CGColor],
                       (id)[[UIColor colorWithWhite: 0.0 alpha:1.0] CGColor], nil];
    gradient.startPoint = CGPointMake(0.5, 0.0); // default; bottom of the view
    gradient.endPoint = CGPointMake(0.5, 1.0);   // default; top of the view
    return gradient;
}
@end
