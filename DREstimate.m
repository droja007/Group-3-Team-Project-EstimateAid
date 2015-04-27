//
//  DREstimate.m
//  TeamProject
//
//  Created by danilo g rojas on 4/23/15.
//  Copyright (c) 2015 Florida International University. All rights reserved.
//

#import "DREstimate.h"

@implementation DREstimate
    

@synthesize estimateName, clientName, employeeName, address, workerCount, averageHoursWorkedPerDay, estimatedDayAmount, currentMaterial, averageHourlyRate, materials;

//singleton
+(id)sharedEstimate {
    static DREstimate *sharedEstimate = nil;
    @synchronized(self){
        if (sharedEstimate == nil)
            sharedEstimate = [[self alloc] init];
        
    }
    return sharedEstimate;
    
}
//init method
-(instancetype) init
{
    self = [super init];
    
    if (self){
        self.materials = [[NSMutableDictionary alloc] init];
        [self.materials setObject:[NSNumber numberWithDouble:0] forKey:@"Lumber"];
        self.photos = [[NSMutableDictionary alloc] init];
    }
    return self;
}
//inits the estimate with a name and creates the material dictionary
-(instancetype) initWithName:(NSString *) name
{
    self = [super init];
    
    if (self){
        self.materials = [[NSMutableDictionary alloc] init];
        self.estimateName = name;
        self.photos = [NSMutableDictionary dictionary];
    }
    return self;
    
}

//material dictionary methods
//adds a material with a cost to the dictionary
-(void) addMaterialToDictionary:(NSString *)materialName withCost:(double)materialCost
{

    [self.materials setObject:[NSNumber numberWithDouble:materialCost] forKey:materialName];
    
}
//get material cost
-(double) getMaterialCost:(NSString *)materialName{
    return [self.materials[materialName] doubleValue];
}
//removes a material from the dictionary
-(void) removeMaterialFromDictionary:(NSString *)materialName{
    [self.materials removeObjectForKey:materialName];
    
}
//update material cost
-(void) updateMaterialInDictionary:(NSString *)materialName withCost:(double)materialCost{
    
    self.materials[materialName] = [NSNumber numberWithDouble:materialCost];
    
}
//return total material cost
-(double) getTotalMaterialCost{
    self.totalMaterialCost = 0;
    for (NSString *key in self.materials) {
        self.totalMaterialCost += [self.materials[key] doubleValue];
    }
    return self.totalMaterialCost;
}
-(int) getMaterialCount{
    return 1;
    //self.materials.count;
    
}
//end dictionary methods


//labor methods
//returns the total labor cost based on our algorhythm (amount of workers * average hourly rate * average hours worked per day * estimated amount of days to complete a job)
-(double) getTotalLaborCost{
    self.totalLaborCost = self.workerCount * self.averageHourlyRate * self.averageHoursWorkedPerDay * self.estimatedDayAmount;
    return self.totalLaborCost;
}
//end labor methods

//photo methods
//adds photo to dictionary
-(void) addPhotoToDictionary:(NSString *)photoName withPhoto:(id)photo
{
    
    [self.photos setObject:photoName forKey:photo];
    
}
//removes a photo from the dictionary
-(void) removePhotoFromDictionary:(NSString *)photoName{
    [self.photos removeObjectForKey:photoName];
    
}
//returns the dictionary of photos
-(NSMutableDictionary *) getPhotos{
    return self.photos;
}
//end photo methods
@end
