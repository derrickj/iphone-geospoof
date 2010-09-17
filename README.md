#README
##What this is
Normally, you can't test your location based code in the simulator. If you use your phone, at least you get real GPS, but you can't test stuff that requires movement unless you jump in a car with your laptop. This code allows you to overcome these problems.

##How to use it
There are to *very* simple approaches you can take. One is easier upfront, and one is better in the long run.
### Quick & Dirty way
1. Import the the .h and .m files into your project.
2. Comment the `#ifdef SPOOF` and `#endif` directives when you want to spoof
### Better
1. Import the .h and .m files into your project.
2. Duplicate one of your testing build configurations
3. Define SPOOF in the Preprocessor Macros section of the build settings of the newly duplicated configuration.

This way is better because you set it up once, and don't need to rely on your memory. You wouldn't want to have forgotten to uncomment the `#ifdef`s in a production app would you?

##How it works
It replaces the `startUpdatingLocation` and `startMonitoringSignificantChanges` methods in the system's CLLocationManager class. The new implementations call `locationManager:didUpdateToLocation:fromLocation:` on the location manager's delegate.