// This file allows you to spoof the iphone's location to test out your app's
// location based code.
// Created by Derrick Jones.
// Do as you please with this code. It's here so you can make better apps :)

#import <CoreLocation/CoreLocation.h>
#import "CLLocationManager+Spoof.h"
#import <unistd.h>

@implementation CLLocationManager(Spoof)
#ifdef SPOOF
-(void)startUpdatingLocation {
	
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
		UIApplication *app = [UIApplication sharedApplication];
		NSInteger bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
			NSLog(@"%@",@"Background task expired. No longer spoofing updates");
		}];
	    CLLocation *old = [[CLLocation alloc] initWithLatitude:37.4217080 longitude:-122.0829964];
		CLLocation *new = [[CLLocation alloc] initWithLatitude:37.4217080 longitude:-122.0829970];
		int i;
		//Start of Long running task
		for ( i = 0; i < 1000; i++ ) {
			sleep(2);
			[self.delegate locationManager:self
					   didUpdateToLocation:old
							  fromLocation:new];
			[old release];
			old = new;
			new = [[CLLocation alloc] initWithLatitude:old.coordinate.latitude + 0.0005
											 longitude:old.coordinate.longitude + 0.0005];
		
		}
		NSLog(@"%@", @"End of Route. Expect no more updates.");
		//End long running task
	
	
		[app endBackgroundTask:bgTask];
	});
		
}

-(void)startMonitoringSignificantLocationChanges {
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
		UIApplication *app = [UIApplication sharedApplication];
		NSInteger bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
			NSLog(@"%@",@"Background task expired. No longer spoofing updates");
		}];
		CLLocation *old = [[CLLocation alloc] initWithLatitude:37.4217080 longitude:-122.0829964];
		CLLocation *new = [[CLLocation alloc] initWithLatitude:37.4217080 longitude:-122.0829970];
		int i;
		//Start of Long running task
		for ( i = 0; i < 1000; i++ ) {
			sleep(30); //unrealistic sleep time, but do you want to wait 5 minutes? nope
			[self.delegate locationManager:self
					   didUpdateToLocation:old
							  fromLocation:new];
			[old release];
			old = new;
			new = [[CLLocation alloc] initWithLatitude:old.coordinate.latitude + 2
											 longitude:old.coordinate.longitude + 2];
			
		}
		NSLog(@"%@", @"End of Route. Expect no more updates.");
		//End long running task
		
		
		[app endBackgroundTask:bgTask];
	});
}

#endif
@end
