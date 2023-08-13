#include <AppKit/AppKit.h>

@interface MyClass : NSObject
@end

@implementation MyClass

static int STEPS = INT_MAX;

static NSButton* applyButton = nil;
static NSSegmentedControl* segmentedControl = nil;
static NSTimer* t = nil;
static int counter = 0;

+(void)onTimer:(NSTimer*)t
{
	NSAutoreleasePool* p = [NSAutoreleasePool new];
	NSLog(@"On timer");

	for (NSWindow* w in [[NSApplication sharedApplication]windows])
	{
		for (NSView* v in [[w contentView]subviews])
		{
			if ([v isKindOfClass:[NSSegmentedControl class]])
			{
				NSLog(@"Segmented control found");
				segmentedControl =(id)v;
				
				t = [NSTimer scheduledTimerWithTimeInterval:0.5 target:[MyClass class] selector:@selector(onSeg) userInfo:nil repeats:YES];
			}
			else if ([v isKindOfClass:[NSButton class]] &&
				     [[(NSButton*)v title]isEqualToString:@"Apply"])
			{
				applyButton = (id)v;
				NSLog(@"Button found - %@", [(NSButton*)v title]);
			}
		}
	}
	
	[p drain];
}

static NSThread* thread = nil;
+(void)onQuit
{
	sleep(15);
	exit(0);
}

+(void)onApply
{
	thread = [[NSThread alloc]initWithTarget:self selector:@selector(onQuit) object:nil];
	[thread start];
	
	[applyButton performClick:nil];
	[applyButton setTitle:@"ApplyX"];
}

+(void)onSeg
{
	if (counter == STEPS)
	{
		[t invalidate];
		[self onApply];
		
		++counter;
		
		return;
	}
	else if (counter > STEPS)
	{
		return;
	}
	
	[NSApp sendAction:[segmentedControl action] to:[segmentedControl target] from:self];
	++counter;
}

@end

class Injector
{
public:
	Injector()
	{
		NSLog(@"SUCCESSFULLY LOADED");
		
		for(NSString* argument in [[NSProcessInfo processInfo]arguments])
		{
			NSString* stepsString = @"steps=";
			if ([argument hasPrefix:stepsString])
			{
				NSString* steps = [argument substringFromIndex:stepsString.length];
				if ([steps intValue])
				{
					STEPS = [steps intValue];
					break;
				}
			}
		}
		
		if (STEPS == INT_MAX)
		{
			NSLog(@"ERROR: Number of overclocking steps not found. You should add, for example, steps=33 to the command line arguments for the app.");
			return;
		}
		
		NSLog(@"Will try to overclock by %d steps.", STEPS);
		
		[NSTimer scheduledTimerWithTimeInterval:2 target:[MyClass class] selector:@selector(onTimer:) userInfo:nil repeats:NO];
	}
};

Injector i;