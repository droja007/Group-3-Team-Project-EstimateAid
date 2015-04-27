//Model class for an estimate
//Here we assign data to an estimate

#import <Foundation/Foundation.h>

@interface DREstimate : NSObject


@property (copy, nonatomic) NSString *estimateName, *clientName, *employeeName, *address, *currentMaterial;
@property (strong, nonatomic) NSMutableDictionary *materials, *photos;
@property (nonatomic) int workerCount, averageHoursWorkedPerDay, estimatedDayAmount;
@property (nonatomic) double averageHourlyRate, totalMaterialCost, totalLaborCost;

+(id)sharedEstimate;
-(instancetype) init;
-(instancetype) initWithName:(NSString *) name;
//material dictionary methods
-(void) addMaterialToDictionary:(NSString *)materialName withCost:(double)materialCost;
-(double) getMaterialCost:(NSString *)materialName;
-(void) removeMaterialFromDictionary:(NSString *)materialName;
-(void) updateMaterialInDictionary:(NSString *)materialName withCost:(double)materialCost;
-(double) getTotalMaterialCost;
-(int) getMaterialCount;

//labor methods
-(double) getTotalLaborCost;

//photomethods
-(void) addPhotoToDictionary:(NSString *)photoName withPhoto:(id)photo;
-(void) removePhotoFromDictionary:(NSString *)photoName;
-(NSMutableDictionary *) getPhotos;

@end
