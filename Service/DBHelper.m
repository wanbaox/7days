//
//  DBHelper.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-22.
//
//

#import "DBHelper.h"

@interface DBHelper()

- (NSURL *)applicationDocumentsDirectory;

@end



static DBHelper * dbHelper = nil;

@implementation DBHelper

@synthesize managedObjectContext;


+(DBHelper *) sharedInstance {
    
	if (!dbHelper) {
        
		dbHelper = [[DBHelper alloc] init];
        
	}
    
	return dbHelper;
    
}

-(void)deleteObject:(id)object
{
    
    [self.managedObjectContext performBlockAndWait:^(){
        
        [self.managedObjectContext deleteObject:object];
        NSError* error = nil;
        if (![self.managedObjectContext save:&error])
            NSLog(@"ERROR:DELETE MESSAGE FAIL...Error LOG: %@", [error localizedDescription]);
    }];
}

-(void)update
{
    
    [self.managedObjectContext performBlockAndWait:^(){
        
        NSError *error = nil;
        if (![self.managedObjectContext save:&error])
            NSLog(@"ERROR:INSERT KEY FAIL...Error LOG: %@", [error localizedDescription]);
    }];
}

//--------------msg
-(NSMutableArray*)fetchMsgs
{
    
    @synchronized(self){
        
        __block NSMutableArray *msgs;
        
        [self.managedObjectContext performBlockAndWait:^(){
            
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            [fetchRequest setEntity:[NSEntityDescription entityForName:@"Msg" inManagedObjectContext:self.managedObjectContext]];
            
            //初始化排序对象
            NSSortDescriptor *sort_type = [[NSSortDescriptor alloc] initWithKey:@"type" ascending:NO];
            NSSortDescriptor *sort_date = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
            //定义排序数据
            NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sort_type, sort_date, nil];
            //    fetchRequest.sortDescriptors = sortDescriptors;//设置查询请求的排序条件
            [fetchRequest setSortDescriptors:sortDescriptors];
            
            
            // Init the fetched results controller
            NSError *error;
            fetcher = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                          managedObjectContext:self.managedObjectContext
                                                            sectionNameKeyPath:nil
                                                                     cacheName:nil];
            fetcher.delegate = self;
            
            if (![fetcher performFetch:&error])
                NSLog(@"ERROR:FETCH KEYS...Error: %@", [error localizedDescription]);
            msgs = [NSMutableArray arrayWithArray:fetcher.fetchedObjects];
            
            
            fetcher = nil;
            fetchRequest = nil;
            
        }];
        
        return msgs;
    }
    
}


-(NSMutableArray*)fetchMsgsWithType:(MsgType)type readed:(BOOL)readed
{
    
    @synchronized(self){
        
        __block NSMutableArray *msgs;
        
        [self.managedObjectContext performBlockAndWait:^(){
            
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            [fetchRequest setEntity:[NSEntityDescription entityForName:@"Msg" inManagedObjectContext:self.managedObjectContext]];
            
            [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"type = %i and isReaded = %i",type,[NSNumber numberWithBool:readed].intValue]];
            
            //初始化排序对象
            NSSortDescriptor *sort_type = [[NSSortDescriptor alloc] initWithKey:@"type" ascending:NO];
            NSSortDescriptor *sort_date = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
            //定义排序数据
            NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sort_type, sort_date, nil];
            //    fetchRequest.sortDescriptors = sortDescriptors;//设置查询请求的排序条件
            [fetchRequest setSortDescriptors:sortDescriptors];
            
            
            // Init the fetched results controller
            NSError *error;
            fetcher = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                          managedObjectContext:self.managedObjectContext
                                                            sectionNameKeyPath:nil
                                                                     cacheName:nil];
            fetcher.delegate = self;
            
            if (![fetcher performFetch:&error])
                NSLog(@"ERROR:FETCH KEYS...Error: %@", [error localizedDescription]);
            msgs = [NSMutableArray arrayWithArray:fetcher.fetchedObjects];
            
            
            fetcher = nil;
            fetchRequest = nil;
            
        }];
        
        return msgs;
    }
    
}

-(NSMutableArray*)fetchMsgsWithUserID:(NSString*)userid readed:(BOOL)readed
{
    
    @synchronized(self){
        
        __block NSMutableArray *msgs;
        
        [self.managedObjectContext performBlockAndWait:^(){
            
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            [fetchRequest setEntity:[NSEntityDescription entityForName:@"Msg" inManagedObjectContext:self.managedObjectContext]];
            
            [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"fromid = %@ and isReaded = %i",userid,[NSNumber numberWithBool:readed].intValue]];
            
            //初始化排序对象
            NSSortDescriptor *sort_type = [[NSSortDescriptor alloc] initWithKey:@"type" ascending:NO];
            NSSortDescriptor *sort_date = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
            //定义排序数据
            NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sort_type, sort_date, nil];
            //    fetchRequest.sortDescriptors = sortDescriptors;//设置查询请求的排序条件
            [fetchRequest setSortDescriptors:sortDescriptors];
            
            
            // Init the fetched results controller
            NSError *error;
            fetcher = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                          managedObjectContext:self.managedObjectContext
                                                            sectionNameKeyPath:nil
                                                                     cacheName:nil];
            fetcher.delegate = self;
            
            if (![fetcher performFetch:&error])
                NSLog(@"ERROR:FETCH KEYS...Error: %@", [error localizedDescription]);
            msgs = [NSMutableArray arrayWithArray:fetcher.fetchedObjects];
            
            
            fetcher = nil;
            fetchRequest = nil;
            
        }];
        
        return msgs;
    }
    
}

-(void)saveMsgFromID:(NSString*)fromid fromname:(NSString*)fromname fromheadurl:(NSString*)fromheadurl msgtype:(MsgType)msgtype content:(NSString*)content date:(NSDate *)date isreaded:(BOOL)isreaded
{

    @synchronized(self){
        
        [self.managedObjectContext performBlockAndWait:^(){
            
            // Insert key
            Msg *msgInstance = (Msg*)[NSEntityDescription insertNewObjectForEntityForName:@"Msg"
                                                                           inManagedObjectContext:self.managedObjectContext];
            
            msgInstance.fromid = fromid;
            msgInstance.fromname = fromname;
            msgInstance.fromheadurl = fromheadurl;
            msgInstance.type = [NSNumber numberWithInt:msgtype];
            msgInstance.content = content;
            msgInstance.date = date;
            msgInstance.isReaded = [NSNumber numberWithBool:isreaded];
            
            // Save the data
            NSError *error = nil;
            if (![self.managedObjectContext save:&error])
                NSLog(@"ERROR:INSERT KEY FAIL...Error LOG: %@", [error localizedDescription]);
        }];
    }
    
    
    //对应更新 msg recent
    MsgRecent * msgRecent;
    if (msgtype == MsgTypeOther) {
        
        //其他消息
        msgRecent = [self fetchMsgRecentWithUserID:fromid];
    }else{
    
        //默认消息
        msgRecent = [self fetchMsgRecentWithType:msgtype];
    }
    
    if (msgRecent) {
        
        //更新 recent
        msgRecent.newmsgcount = [NSNumber numberWithInteger:msgRecent.newmsgcount.intValue+1];
        msgRecent.content = content;
        //以下两个 有可能会改变
        msgRecent.username = fromname;
        msgRecent.userheadurl = fromheadurl;
        
        [self update];
        
    }else{
        
        //add recent
        [self saveMsgRecentSort:msgtype == MsgTypeOther?MsgSort_Other:MsgSort_System type:msgtype content:content date:date newmsgcount:1 userid:fromid username:fromname userheadurl:fromheadurl];
        
    }

}


-(void)clearMsgs
{

    @synchronized(self){
        
        [self.managedObjectContext performBlockAndWait:^(){
            
            NSMutableArray * msgs = [[DBHelper sharedInstance]fetchMsgs];
            
            
            for (Msg *msg  in msgs) {
                
                
                [self.managedObjectContext deleteObject:msg];
            }
            
            NSError* error = nil;
            if (![self.managedObjectContext save:&error])
                NSLog(@"ERROR:CLEAR KEYS FAIL...Error LOG: %@", [error localizedDescription]);
        }];
    }
}



//------------msgrecent
-(NSMutableArray*)fetchMsgRecents
{
    
    @synchronized(self){
        
        __block NSMutableArray *msgs;
        
        [self.managedObjectContext performBlockAndWait:^(){
            
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            [fetchRequest setEntity:[NSEntityDescription entityForName:@"MsgRecent" inManagedObjectContext:self.managedObjectContext]];
            
            //初始化排序对象
            NSSortDescriptor *sort_type = [[NSSortDescriptor alloc] initWithKey:@"sort" ascending:YES];
            NSSortDescriptor *sort_new = [[NSSortDescriptor alloc] initWithKey:@"newmsgcount" ascending:NO];
            NSSortDescriptor *sort_date = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
            NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sort_type, sort_new, sort_date, nil];
            [fetchRequest setSortDescriptors:sortDescriptors];
            
            
            // Init the fetched results controller
            NSError *error;
            fetcher = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                          managedObjectContext:self.managedObjectContext
                                                            sectionNameKeyPath:nil
                                                                     cacheName:nil];
            fetcher.delegate = self;
            
            if (![fetcher performFetch:&error])
                NSLog(@"ERROR:FETCH KEYS...Error: %@", [error localizedDescription]);
            msgs = [NSMutableArray arrayWithArray:fetcher.fetchedObjects];
            
            
            fetcher = nil;
            fetchRequest = nil;
            
        }];
        
        return msgs;
    }
    
}

-(MsgRecent*)fetchMsgRecentWithType:(MsgType)type;
{
    
    @synchronized(self){
        
        __block NSMutableArray *keys=nil;
        
        [self.managedObjectContext performBlockAndWait:^(){
            
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            [fetchRequest setEntity:[NSEntityDescription entityForName:@"MsgRecent" inManagedObjectContext:self.managedObjectContext]];
            
            [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"type = %i",type]];
            
            
            //初始化排序对象
            NSSortDescriptor *sort_type = [[NSSortDescriptor alloc] initWithKey:@"sort" ascending:YES];
            NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sort_type, nil];
            [fetchRequest setSortDescriptors:sortDescriptors];
            
            
            // Init the fetched results controller
            NSError *error;
            fetcher = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                          managedObjectContext:self.managedObjectContext
                                                            sectionNameKeyPath:nil
                                                                     cacheName:nil];
            fetcher.delegate = self;
            
            
            if (![fetcher performFetch:&error])
                NSLog(@"ERROR:FETCH KEYS...Error: %@", [error localizedDescription]);
            
            keys = [NSMutableArray arrayWithArray:fetcher.fetchedObjects];
            
            fetcher = nil;
            fetchRequest = nil;
        }];
        
        
        if ([keys count]>0) {
            
            return [keys objectAtIndex:0];
        }else{
            
            return nil;
        }
    }
}

-(MsgRecent*)fetchMsgRecentWithUserID:(NSString*)userid;
{
    
    @synchronized(self){
        
        __block NSMutableArray *keys=nil;
        
        [self.managedObjectContext performBlockAndWait:^(){
            
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            [fetchRequest setEntity:[NSEntityDescription entityForName:@"MsgRecent" inManagedObjectContext:self.managedObjectContext]];
            
            [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"userid = %@",userid]];
            
            
            //初始化排序对象
            NSSortDescriptor *sort_sort = [[NSSortDescriptor alloc] initWithKey:@"sort" ascending:YES];
            NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sort_sort, nil];
            [fetchRequest setSortDescriptors:sortDescriptors];
            
            
            // Init the fetched results controller
            NSError *error;
            fetcher = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                          managedObjectContext:self.managedObjectContext
                                                            sectionNameKeyPath:nil
                                                                     cacheName:nil];
            fetcher.delegate = self;
            
            
            if (![fetcher performFetch:&error])
                NSLog(@"ERROR:FETCH KEYS...Error: %@", [error localizedDescription]);
            
            keys = [NSMutableArray arrayWithArray:fetcher.fetchedObjects];
            
            fetcher = nil;
            fetchRequest = nil;
        }];
        
        
        if ([keys count]>0) {
            
            return [keys objectAtIndex:0];
        }else{
            
            return nil;
        }
    }
}

-(void)saveMsgRecentSort:(MsgSort)sort type:(MsgType)type content:(NSString*)content date:(NSDate*)date newmsgcount:(NSInteger)newmsgcount userid:(NSString*)userid username:(NSString*)username userheadurl:(NSString*)userheadurl
{
    
    @synchronized(self){
        
        [self.managedObjectContext performBlockAndWait:^(){
            
            // Insert key
            MsgRecent *msgInstance = (MsgRecent*)[NSEntityDescription insertNewObjectForEntityForName:@"MsgRecent"
                                                                   inManagedObjectContext:self.managedObjectContext];
            
            msgInstance.type = [NSNumber numberWithInt:type];
            msgInstance.sort = [NSNumber numberWithInt:sort];
            msgInstance.content = content;
            msgInstance.date = date;
            msgInstance.newmsgcount = [NSNumber numberWithInteger:newmsgcount];
            msgInstance.userid = userid;
            msgInstance.username = username;
            msgInstance.userheadurl = userheadurl;
            
            
            // Save the data
            NSError *error = nil;
            if (![self.managedObjectContext save:&error])
                NSLog(@"ERROR:INSERT KEY FAIL...Error LOG: %@", [error localizedDescription]);
        }];
    }
}

-(void)clearMsgRecents
{
    @synchronized(self){
        
        [self.managedObjectContext performBlockAndWait:^(){
            
            NSMutableArray * msgs = [[DBHelper sharedInstance]fetchMsgs];
            
            
            for (Msg *msg  in msgs) {
                
                
                [self.managedObjectContext deleteObject:msg];
            }
            
            NSError* error = nil;
            if (![self.managedObjectContext save:&error])
                NSLog(@"ERROR:CLEAR KEYS FAIL...Error LOG: %@", [error localizedDescription]);
        }];
    }

}

-(void)setMsgRecentReaded:(MsgRecent*)msgRecent{

    msgRecent.newmsgcount = 0;
    
    if (msgRecent.type.intValue == MsgTypeOther) {
        
        //other
        NSMutableArray * msgs = [self fetchMsgsWithUserID:msgRecent.userid readed:NO];
        for (Msg * msg in msgs) {
            
            msg.isReaded = [NSNumber numberWithBool:YES];
            
        }
        
    }else{
    
        //默认消息类别
        NSMutableArray * msgs = [self fetchMsgsWithType:msgRecent.type.intValue readed:NO];
        for (Msg * msg in msgs) {
            
            msg.isReaded = [NSNumber numberWithBool:YES];
            
        }
        
    }
    
    [self update];
}

- (int) getUnreadMsgNumber
{
    @synchronized(self){
        
        __block int size;
        
        [self.managedObjectContext performBlockAndWait:^(){
            
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            [fetchRequest setEntity:[NSEntityDescription entityForName:@"Msg" inManagedObjectContext:self.managedObjectContext]];
            
            [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"isReaded = %i",0]];
            
            //初始化排序对象
            NSSortDescriptor *sort_date = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
            NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sort_date, nil];
            [fetchRequest setSortDescriptors:sortDescriptors];
            
            
            // Init the fetched results controller
            NSError *error;
            fetcher = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                          managedObjectContext:self.managedObjectContext
                                                            sectionNameKeyPath:nil
                                                                     cacheName:nil];
            fetcher.delegate = self;
            if (![fetcher performFetch:&error])
                NSLog(@"ERROR:FETCH KEYS...Error: %@", [error localizedDescription]);
            
            size = fetcher.fetchedObjects.count;
            
            fetcher = nil;
            fetchRequest = nil;
            
        }];
        
        return size;
    }
}







#pragma mark - Core Data stack

/*
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext
{
    
    if (managedObjectContext !=nil) {
        
        return managedObjectContext;
    }
    
    
    //    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"sciener" withExtension:@"sqlite"];
    //    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"sciener.sqlite"];
    
    /*
     Set up the store.
     For the sake of illustration, provide a pre-populated default store.
     */
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // If the expected store doesn't exist, copy the default store.
    if (![fileManager fileExistsAtPath:[storeURL path]]) {
        
        NSLog(@"NSPersistentStoreCoordinator copy");
        
        NSURL *defaultStoreURL = [[NSBundle mainBundle] URLForResource:@"sciener" withExtension:@"sqlite"];
        if (defaultStoreURL) {
            [fileManager copyItemAtURL:defaultStoreURL toURL:storeURL error:NULL];
        }
    }
    
    
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: model];
    
    NSError *error;
    
    //    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
    //        NSLog(@"ERROR:INIT COREDATA...Error: %@", [error localizedDescription]);
    //    }else{
    //
    //        managedObjectContext = [[NSManagedObjectContext alloc]
    //                   initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    ////		managedObjectContext = [[NSManagedObjectContext alloc] init];
    //		[managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
    //    }
    
    
    
    
    
    
    
    //TODO 数据库升级用这个，这个NSMigratePersistentStoresAutomaticallyOption和NSInferMappingModelAutomaticallyOption都为yes，就是自动升级，也就是轻量级的数据库迁移。为no的话，就是手动升级，另外一种数据库迁移方法，针对复杂的数据库升级
    
    //自动升级
    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption: @YES, NSInferMappingModelAutomaticallyOption: @YES};
    
    //手动升级
    //    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],
    //                                       NSMigratePersistentStoresAutomaticallyOption,
    //                                       [NSNumber numberWithBool:NO],
    //                                       NSInferMappingModelAutomaticallyOption,
    //                                       nil];
    
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        
        
        abort();
    }else{
        
        managedObjectContext = [[NSManagedObjectContext alloc]
                                initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        //		managedObjectContext = [[NSManagedObjectContext alloc] init];
		[managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    
    
    return managedObjectContext;
    
}




/*
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
//- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
//{
//    if (persistentStoreCoordinator != nil) {
//        return persistentStoreCoordinator;
//    }
//
//    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"sciener.sqlite"];
//
//    /*
//     Set up the store.
//     For the sake of illustration, provide a pre-populated default store.
//     */
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    // If the expected store doesn't exist, copy the default store.
//    if (![fileManager fileExistsAtPath:[storeURL path]]) {
//
//
//        NSURL *defaultStoreURL = [[NSBundle mainBundle] URLForResource:@"sciener" withExtension:@"sqlite"];
//        if (defaultStoreURL) {
//            [fileManager copyItemAtURL:defaultStoreURL toURL:storeURL error:NULL];
//        }
//    }
//
//    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption: @YES, NSInferMappingModelAutomaticallyOption: @YES};
//    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
//
//    NSError *error;
//
//    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
//        NSLog(@"ERROR:INIT COREDATA...Error: %@", [error localizedDescription]);
//    }
//
//    //数据库更新的时候使用
//    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
//        /*
//         Replace this implementation with code to handle the error appropriately.
//
//         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//         Typical reasons for an error here include:
//         * The persistent store is not accessible;
//         * The schema for the persistent store is incompatible with current managed object model.
//         Check the error message to determine what the actual problem was.
//
//
//         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
//
//         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
//         * Simply deleting the existing store:
//         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
//
//         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
//         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
//
//         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
//
//         */
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        abort();
//    }
//
//    return persistentStoreCoordinator;
//}


#pragma mark - Application's documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end
