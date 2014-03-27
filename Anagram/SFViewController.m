//
//  SFViewController.m
//  Anagram
//
//  Created by Spencer Fornaciari on 3/26/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFViewController.h"
#define NO_OF_CHARS 256


@interface SFViewController ()

@property (nonatomic) NSMutableArray *myString, *myString2;

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *str1 = @"muTiLaTe";
    NSString *str2 = @"UltImatE";
    NSString *str3 = @"asfds";
    NSString *str7 = @"ASDF";
    NSString *str4 = @"Dictionary";
    NSString *str5 = @"Indicatory";
    NSString *str6 = @"abcdefghijklmnopqrstuvwxyza";
    
//    [self checkForRepetition:str6];
    
    [self reverseString:str3];
    [self reverseString:str7];

    
    
//    [self anagramComparisonStringOne:str1 andStringTwo:str2];
    
//    NSString *string1 = [self anagramSort:str1];
//    NSString *string2 = [self anagramSort:str2];
    
    
    
//    NSLog(@"%@", );
//    BOOL ana = [self anagramsWithString:str1 andString:str2];
//    BOOL ana2 = [self anagramsWithString:str1 andString:str3];
//    NSLog(@"%hhd", ana);
//    NSLog(@"%hhd", ana2);
    
//    NSMutableArray *array1=[NSMutableArray arrayWithObjects:@"1",@"2",@"2",@"3",@"3",@"3",@"2",@"5",@"6",@"6",nil];
//    NSMutableArray *uniqueArray = [NSMutableArray new];
////    [uniqueArray addObjectsFromArray:[[NSSet setWithArray:array1] allObjects]];
//    NSLog(@"%@", uniqueArray);

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Compare strings for anagrams

-(void)anagramComparisonStringOne:(NSString *)stringOne andStringTwo:(NSString *)stringTwo
{
    //Check to see if their lengths are the same
    if (stringOne.length != stringTwo.length) {
        NSLog(@"FALSE");
    }
    //If lengths are the same compare strings
    else {
        if ([[self convertStringToArray:[stringOne lowercaseString]] isEqual:[self convertStringToArray:[stringTwo lowercaseString]]]) {
            NSLog(@"TRUE");
            
        } else {
            NSLog(@"FALSE");
        }
        
    }
    
}

-(NSMutableArray *)convertStringToArray:(NSString *)string
{
    int len = string.length;
    
    //Convert String into an NSMutableArray
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int q=0; q < len; q++) {
        NSString *tmp_str = [string substringWithRange:NSMakeRange(q, 1)];
        [arr addObject:[tmp_str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    
    //Bubble sort strings in NSMutableArray
    for (int i = 0; i < len; i++) {
        for (int k = 0; k < len - 1; k++) {
            NSComparisonResult result = [arr[k] compare:arr[k+1]];
            
            if (result ==NSOrderedDescending) {
                NSString *a = arr[k+1];
                arr[k+1] = arr[k];
                arr[k] = a;
            }
        }
        
    }
    
    return arr;
}

#pragma mark - Check for repition

-(void)checkForRepetition:(NSString *)string
{
    BOOL repeat = FALSE;
    
    for (int q=0; q < string.length; q++) {
        NSString *tmp_string = [string substringWithRange:NSMakeRange(q, 1)];
        int asciiCode2 = [tmp_string characterAtIndex:0];
        NSLog(@"Original: %d", asciiCode2);

        for (int i = 0; i< string.length; i++) {
            NSString *tmp_str = [string substringWithRange:NSMakeRange(i, 1)];
            int asciiCode = [tmp_str characterAtIndex:0];
            NSLog(@"Test: %d", asciiCode);
            if (asciiCode2 == asciiCode && q != i) {
                repeat = TRUE;
            }
            
        }
        
        
    }
    
    NSLog(@"%hhd", repeat);
}

#pragma mark - Reverse String

-(void)reverseString:(NSString *)string
{
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < string.length; i++) {
        NSString *temp = [string substringWithRange:NSMakeRange(i, 1)];
        [array addObject:temp];
    }
    
//    NSLog(@"%@ - and count, %d", array, array.count);
    
    for (int j = 0; j < string.length / 2; j++) {
//        NSLog(@"%@", array[j]);
//        
//        NSLog(@"%d", string.length - j);
        NSString *temp = array[string.length-(j+1)];
        array[string.length-(j+1)] = array[j];
        array[j] = temp;
        
    }
    
    NSLog(@"%@", array);
    
//    if (string.length % 2 == 0) {
//       
//    } else {
//        for (int j = 0; j < string.length / 2; j++) {
//            NSString *temp = array[string.length-j];
//            array[string.length-j] = array[j];
//            array[j] = temp;
//            
//        }
//    }
    
    NSLog(@"%@", array);
    
}

-(BOOL)anagramsWithString:(NSString*)a andString:(NSString*)b
{
    //Check if the strings are the same length - returns false if no, otherwise tests further
    return (a.length != b.length) ? FALSE : [self anagramsCheckWith:a andString:b];
}


-(BOOL)anagramsCheckWith:(NSString*)a andString:(NSString*)b
{
    NSCountedSet *aSet = [NSCountedSet new];
    NSCountedSet *bSet = [NSCountedSet new];
    
    for (int i = 0; i < a.length; i++)
    {
        [aSet addObject:@([a characterAtIndex:i])];
        [bSet addObject:@([b characterAtIndex:i])];
    }
    
    NSLog(@"%@", aSet);
    NSLog(@"%@", bSet);
    return [aSet isEqual:bSet];
}
@end
