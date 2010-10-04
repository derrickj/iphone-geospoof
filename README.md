#iPhone GeoSpoof
##What this is
We all know the iPhone simulator is all but useless for testing location based code. To remedy this, I’ve created a simple simple Objective-C category that you can use to simulate location changes. It’s not over engineered. You don’t have to go figure out a weird file format to and edit that file to get it to work. Just program your routes.

##How to use it
There are two *very* simple approaches you can take. One is easier upfront, and one is better in the long run.

### Quick & Dirty way
1. Import the the .h and .m files into your project.
2. Comment the `#ifdef SPOOF` and `#endif` directives when you want to spoof


### Better
1. Import the .h and .m files into your project.
2. Duplicate one of your testing build configurations
3. Define `SPOOF` in the Preprocessor Macros section of the build settings of the newly duplicated configuration.

This way is better because you set it up once, and don't need to rely on your memory. You wouldn't want to have forgotten to uncomment the `#ifdef`s in a production app would you?

##How it works
It replaces the `startUpdatingLocation` and `startMonitoringSignificantChanges` methods in the system's CLLocationManager class. The new implementations call `locationManager:didUpdateToLocation:fromLocation:` on the location manager's delegate.
