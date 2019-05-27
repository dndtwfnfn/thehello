//
//  ViewController3.m
//  the hello
//
//  Created by 臧 传志 on 2019/5/23.
//  Copyright © 2019年 臧 传志. All rights reserved.
//

#import "ViewController3.h"
#import "sqlite3.h"
#import "cellItem.h"
#import "AppDelegate.h"
@interface ViewController3 (){

sqlite3 *sqlite2;

};

@end



@implementation ViewController3
@synthesize arrPeople;
- (void)viewDidLoad {
    [super viewDidLoad];
    
     arrPeople = [[NSMutableArray alloc]init];
    
    NSString *path2=[[NSBundle mainBundle]pathForResource:@"xxkjb" ofType:@"db"];
    int result=sqlite3_open(path2.UTF8String, &sqlite2);
    
    if (result==SQLITE_OK){
        NSLog(@"打开数据库成功");
        
    }
    else
    {
        NSLog(@"打开失败");
        
    }
    
    
    //char *errmsg;
    //获取记录
    NSString *zsql1 = [NSString stringWithFormat:@"SELECT * from [1jczz]"];
    //NSString *zsql = [NSString stringWithFormat:@"SELECT count(*) from tk"];
    const char *sql1= [zsql1 cStringUsingEncoding:NSASCIIStringEncoding];
    sqlite3_stmt *stmt1;
    int status = sqlite3_prepare_v2(sqlite2, sql1, -1, &stmt1, NULL);
    // int status = sqlite3_exec(sqlite,sql,zcallback,zcount,&errmsg);
   
    if(SQLITE_OK ==status){
        while (sqlite3_step(stmt1) == SQLITE_ROW) {//对表中的数据进行遍历，并转为item加入arrPeople中
            
            cellItem *item = [[cellItem alloc]init];
            
            const char *timuChar = (const char *)sqlite3_column_text(stmt1,2);
            const char *datiChar = (const char *)sqlite3_column_text(stmt1,5);
            int row = sqlite3_column_int(stmt1, 0);
            item.row = [[NSString alloc] initWithFormat:@"%d",row];
            //   item.age = [[NSString alloc] initWithFormat:@"%d",age];
          // item.timu = [[NSString alloc] initWithUTF8String:timuChar];
        //  item.dati = [[NSString alloc] initWithUTF8String:datiChar];
            
          item.timu =[NSString stringWithUTF8String:timuChar];
          //   item.dati=[NSString stringWithUTF8String:datiChar];
            [arrPeople addObject:item];
           
            
        }
      //  sqlite3_finalize(stmt1);//结束之前清除statement对象，
       
    }
     sqlite3_close(sqlite2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 其实tableView可以被分成很多section，每个部分在视图上是独立分开的，在此app中，不区分section，所有的数据都显示在一个部分，所以直接返回datas的长度
  return [arrPeople count];
  
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 定义标示符
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    // 声明一个cell对象，这个方法是从可重用队列里面取出一个表格单元，如果没有可重用单元格，就会返回nil，就需要判断
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        // 如果没有可重用的单元格对象，就使用标示符重新创建一个单元格对象，
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    
    // textLabel是默认的单元格包含的一个文本标签，设置它的text属性为datas中的数据
    // cell.textLabel.text = self.datas[indexPath.row];
    NSInteger row = [indexPath row];
    cellItem *item = [arrPeople  objectAtIndex:row];
    
  //  cell.textLabel.text =[item.row stringByAppendingString:item.timu];
   cell.textLabel.text =item.timu;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    cellItem *item = [arrPeople  objectAtIndex:row];
    
   //UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"行选择" message:item.timu delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
   // [messageAlert show];
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.zselectid = [[NSString alloc] initWithFormat:@"%d",row+1];
    
}
/*
 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
