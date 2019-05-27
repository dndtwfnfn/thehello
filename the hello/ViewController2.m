//
//  ViewController2.m
//  the hello
//
//  Created by 臧 传志 on 2018/11/7.
//  Copyright © 2018年 臧 传志. All rights reserved.
//

#import "ViewController2.h"
#import "sqlite3.h"
#import "AppDelegate.h"
@interface ViewController2 (){
sqlite3 *sqlite2;
//stmt用来取出查询结果

NSString *zduostr;
int z;
int zcount;
}
@end

@implementation ViewController2

-(void)viewWillAppear:(BOOL)animated{   //返回刷新页面
    
    [super viewWillAppear:animated];
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];

    z= [myDelegate.zselectid intValue];
    [self getrecord];
    

   
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
   
    
   CGRect rect = [[UIScreen mainScreen] bounds];
   CGSize size = rect.size;
   CGFloat width = size.width;
    CGFloat height = size.height;
   
  CGFloat zheight=height/14;
   
    // Do any additional setup after loading the view, typically from a nib.
    UIButton * button=[UIButton buttonWithType:UIButtonTypeSystem];
   // button.frame=CGRectMake(10,490, 300, 30);
     button.frame=CGRectMake(10,30, width-20, 20);
    button.backgroundColor=[UIColor redColor];
    [button setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [button setTitle:@"点我变化颜色" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // NSString *documentsDirectory = [paths objectAtIndex:0];
    // NSString *path = [documentsDirectory stringByAppendingPathComponent:@"database_name"];
    //NSString *path=[[NSBundle mainBundle]pathForResource:@"zczsqlite" ofType:@"db"];
    
    NSString *path2=[[NSBundle mainBundle]pathForResource:@"xxkjb" ofType:@"db"];
    
    //  NSString *path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"sqlite"];
    //  NSString *filename=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"shop.sqlite"];
    
    //  int result=sqlite3_open([path cStringUsingEncoding:NSUTF8StringEncoding], &sqlite);
    int result=sqlite3_open(path2.UTF8String, &sqlite2);
    
    if (result==SQLITE_OK){
        NSLog(@"打开数据库成功");
        // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您好！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //[alert show];
        
        
    }
    else
    {
        NSLog(@"打开失败");
        //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"不好意思！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //[alert show];
        
        
        
        
        //  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"3" preferredStyle:  UIAlertControllerStyleAlert];
        //   [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
        //  }]];
        //  [self presentViewController:alert animated:true completion:nil];
    }
    z=0;
    
    //char *errmsg;
    //获取记录
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
   // myDelegate.zindex=@"1";
    NSString *zsql1;
    
    if ([myDelegate.zindex intValue]==1){
    zsql1 = [NSString stringWithFormat:@"SELECT count(*) from [1jczz]"];
    
    }
    else
    {
       zsql1 = [NSString stringWithFormat:@"SELECT count(*) from [2xxjs]"];
    }
    
    //NSString *zsql = [NSString stringWithFormat:@"SELECT count(*) from tk"];
    const char *sql1= [zsql1 cStringUsingEncoding:NSASCIIStringEncoding];
    sqlite3_stmt *stmt1;
    int status = sqlite3_prepare_v2(sqlite2, sql1, -1, &stmt1, NULL);
    // int status = sqlite3_exec(sqlite,sql,zcallback,zcount,&errmsg);
    if(SQLITE_OK ==status){
        NSLog(@"打开数据库成功");
        
        
        sqlite3_step(stmt1);
        
        zcount=sqlite3_column_int(stmt1, 0);
        
        
      
        
        // CGFloat height = size.height;
        
        //  zlabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, width, 120)];
        zlabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 80, width, zheight*3)];
        //zlabel.lineBreakMode=UILineBreakModeWordWrap;
        //zlabel.lineBreakMode=UILineBreakModeTailTruncation;
        zlabel.lineBreakMode= NSLineBreakByTruncatingTail;
        
        zlabel.numberOfLines=0;
        zlabel.adjustsFontSizeToFitWidth=YES;
        [self.view addSubview:zlabel];
        
        
        zlabelstyle=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, width, 20)];
        zlabelstyle.lineBreakMode=NSLineBreakByTruncatingTail;
        zlabelstyle.numberOfLines=0;
        zlabelstyle.adjustsFontSizeToFitWidth=YES;
        [self.view addSubview:zlabelstyle];
        zlabelstyle.hidden=true;
        
        //labela=[[UILabel alloc]initWithFrame:CGRectMake(0, 150, width, 50)];
        labela=[[UILabel alloc]initWithFrame:CGRectMake(10, zheight*3+80, width-20, zheight)];
        labela.lineBreakMode=NSLineBreakByTruncatingTail;
        labela.numberOfLines=0;
        labela.adjustsFontSizeToFitWidth=YES;
        [self.view addSubview:labela];
        
        //labelb=[[UILabel alloc]initWithFrame:CGRectMake(0, 200, width, 50)];
        labelb=[[UILabel alloc]initWithFrame:CGRectMake(10, zheight*4+80, width-20, zheight)];
        
        labelb.lineBreakMode=NSLineBreakByTruncatingTail;
        labelb.numberOfLines=0;
        labelb.adjustsFontSizeToFitWidth=YES;
        [self.view addSubview:labelb];
        
        //labelc=[[UILabel alloc]initWithFrame:CGRectMake(0, 250, width, 50)];
        labelc=[[UILabel alloc]initWithFrame:CGRectMake(10, zheight*5+80, width-20, zheight)];
        labelc.lineBreakMode=NSLineBreakByTruncatingTail;
        labelc.numberOfLines=0;
        labelc.adjustsFontSizeToFitWidth=YES;
        [self.view addSubview:labelc];
        
        //labeld=[[UILabel alloc]initWithFrame:CGRectMake(0, 300, width, 50)];
        labeld=[[UILabel alloc]initWithFrame:CGRectMake(10, zheight*6+80, width-20, zheight)];
        labeld.lineBreakMode=NSLineBreakByTruncatingTail;
        labeld.numberOfLines=0;
        labeld.adjustsFontSizeToFitWidth=YES;
        [self.view addSubview:labeld];
        
        //labele=[[UILabel alloc]initWithFrame:CGRectMake(0, 350, width, 50)];
        labele=[[UILabel alloc]initWithFrame:CGRectMake(10, zheight*7+80, width-20, zheight)];
        labele.lineBreakMode=NSLineBreakByTruncatingTail;
        labele.numberOfLines=0;
        labele.adjustsFontSizeToFitWidth=YES;
        [self.view addSubview:labele];
        
        // labelf=[[UILabel alloc]initWithFrame:CGRectMake(0, 400, width, 50)];
        labelf=[[UILabel alloc]initWithFrame:CGRectMake(10, zheight*8+80, width-20, zheight)];
        labelf.lineBreakMode=NSLineBreakByTruncatingTail;
        labelf.numberOfLines=0;
        labelf.adjustsFontSizeToFitWidth=YES;
        [self.view addSubview:labelf];
        
        
        // labelok=[[UILabel alloc]initWithFrame:CGRectMake(0, 450, width, 50)];
        labelok=[[UILabel alloc]initWithFrame:CGRectMake(10, zheight*9+80, width-20, zheight)];
        labelok.lineBreakMode=NSLineBreakByTruncatingTail;
        labelok.numberOfLines=0;
        labelok.adjustsFontSizeToFitWidth=YES;
        [self.view addSubview:labelok];
        labelok.hidden=true;
        
        
        // labelcount=[[UILabel alloc]initWithFrame:CGRectMake(width-100, 450, width, 50)];
        labelcount=[[UILabel alloc]initWithFrame:CGRectMake(width-100, zheight*9+80, width-20, zheight)];
        labelcount.lineBreakMode=NSLineBreakByTruncatingTail;
        labelcount.numberOfLines=0;
        labelcount.adjustsFontSizeToFitWidth=YES;
        [self.view addSubview:labelcount];
        
        labela.text=@"";
        labelb.text=@"";
        labelc.text=@"";
        labeld.text=@"";
        labele.text=@"";
        labelf.text=@"";
        labelok.text=@"";
        zlabel.text=@"";
        
        
        UITapGestureRecognizer *tapRecognizerWeiboa=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zclick:)];
        
        labela.userInteractionEnabled=YES;
        [labela addGestureRecognizer:tapRecognizerWeiboa];
        
        UITapGestureRecognizer *tapRecognizerWeibob=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zclick:)];
        labelb.userInteractionEnabled=YES;
        [labelb addGestureRecognizer:tapRecognizerWeibob];
        
        UITapGestureRecognizer *tapRecognizerWeiboc=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zclick:)];
        labelc.userInteractionEnabled=YES;
        [labelc addGestureRecognizer:tapRecognizerWeiboc];
        
        UITapGestureRecognizer *tapRecognizerWeibod=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zclick:)];
        labeld.userInteractionEnabled=YES;
        [labeld addGestureRecognizer:tapRecognizerWeibod];
        
        UITapGestureRecognizer *tapRecognizerWeiboe=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zclick:)];
        labele.userInteractionEnabled=YES;
        [labele addGestureRecognizer:tapRecognizerWeiboe];
        
        UITapGestureRecognizer *tapRecognizerWeibof=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zclick:)];
        labelf.userInteractionEnabled=YES;
        [labelf addGestureRecognizer:tapRecognizerWeibof];
        
        
        
        
        
        
        
        
        self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
        self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
        self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
        self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
        [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
        [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
        
        
        
        /*  UILabel *JGlabel = [[UILabel alloc]init];
         
         JGlabel.backgroundColor = [UIColor greenColor];
         JGlabel.text = @"";
         //    JGlabel.numberOfLines = 0;// 0为多行
         // 设置Label的字体
         JGlabel.font = [UIFont systemFontOfSize:14.0];
         // 根据字体得到label的内容的尺寸
         CGSize size = [JGlabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:JGlabel.font,NSFontAttributeName,nil]];
         // label的内容的宽度
         CGFloat JGlabelContentWidth = size.width;
         
         // 如果label的内容的宽度度超过150，则label的宽度就设置为150，即label的最大宽度为150
         if (JGlabelContentWidth >= 150.0) {
         JGlabelContentWidth = 150.0;
         }
         
         JGlabel.frame = CGRectMake(0,100, JGlabelContentWidth,60);
         
         [self.view addSubview:JGlabel];*/
        
    }
    // [NSThread sleepForTimeInterval:3.0];
    
  //  AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
   
   
    //z=1;
    z= [myDelegate.zselectid intValue];
    [self getrecord];
}
int zcallback( void * para, int n_column, char ** column_value, char ** column_name )
{
    //para是你在 sqlite3_exec 里传入的 void * 参数
    //通过para参数，你可以传入一些特殊的指针（比如类指针、结构指针），然后在这里面强制转换成对应的类型（这里面是void*类型，必须强制转换成你的类型才可用）。然后操作这些数据
    //n_column是这一条记录有多少个字段 (即这条记录有多少列)
    // char ** column_value 是个关键值，查出来的数据都保存在这里，它实际上是个1维数组（不要以为是2维数组），每一个元素都是一个 char * 值，是一个字段内容（用字符串来表示，以/0结尾）
    //char ** column_name 跟 column_value是对应的，表示这个字段的字段名称
    //这里，我不使用 para 参数。忽略它的存在.
    para=column_value[0];
    return 0;
}

-(void) zclick:(UITapGestureRecognizer *)sender{
    NSString *str1=zlabelstyle.text;
    NSString *str = [str1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *str2=@"一、单选题";
    NSString *str3=@"二、多选题";
    
    if ([str isEqualToString:str2]){
        UITapGestureRecognizer *tap = (UITapGestureRecognizer*)sender;
        labela.backgroundColor=[UIColor clearColor];
        labelb.backgroundColor=[UIColor clearColor];
        labelc.backgroundColor=[UIColor clearColor];
        labeld.backgroundColor=[UIColor clearColor];
        labele.backgroundColor=[UIColor clearColor];
        labelf.backgroundColor=[UIColor clearColor];
        UILabel *la=(UILabel*)tap.view;
        la.backgroundColor=[UIColor lightGrayColor];
        
        // NSString *str1 = [string substringToIndex:5];//截取掉下标5之前的字符串
        // NSString *str2 = [string substringFromIndex:3];//截取掉下标3之后的字符串
        NSString *str1=[la.text substringToIndex:1];
        NSString *str2=[labelok.text substringFromIndex:3];
        if (str1==str2){
            labelok.hidden=false;
            la.backgroundColor=[UIColor greenColor];
        }
        else
        {
            labelok.hidden=true;
            la.backgroundColor=[UIColor redColor];
            
        }
    }
    else if([str isEqualToString:str3]){
        UITapGestureRecognizer *tap = (UITapGestureRecognizer*)sender;
        
        UILabel *la=(UILabel*)tap.view;
        if (la.backgroundColor==[UIColor lightGrayColor]){
            la.backgroundColor=[UIColor clearColor];
            
        }
        else
        {
            la.backgroundColor=[UIColor lightGrayColor];
            
        }
        
        
        //字条串是否包含有某字符串
        /* if ([string rangeOfString:@"martin"].location == NSNotFound) {
         NSLog(@"string 不存在 martin");
         } else {
         NSLog(@"string 包含 martin");
         }*/
        
        //NSString *string = @"xxx.pngpngpng";
        //NSString *result = [string stringByReplacingOccurrencesOfString:@"png" WithString:@""];
        
        NSString *str1=[la.text substringToIndex:1];
        NSString *str2=[labelok.text substringFromIndex:3];
        if ([str2 rangeOfString:str1].location == NSNotFound) {
            // labelok.hidden=false;
            // la.backgroundColor=[UIColor greenColor];
        }
        else
        {
            //labelok.hidden=true;
            la.backgroundColor=[UIColor greenColor];
            
        }
        
        if (la.backgroundColor==[UIColor greenColor]){
            zduostr=[zduostr stringByAppendingString:str1 ];
        }
        if (zduostr.length>0){
            if (zduostr.length==str2.length){
                labelok.hidden=false;
            }
            else
            {
                labelok.hidden=true;
                
            }
        }
    }
    else
    {
        
        UITapGestureRecognizer *tap = (UITapGestureRecognizer*)sender;
        labela.backgroundColor=[UIColor clearColor];
        labelb.backgroundColor=[UIColor clearColor];
        labelc.backgroundColor=[UIColor clearColor];
        labeld.backgroundColor=[UIColor clearColor];
        labele.backgroundColor=[UIColor clearColor];
        labelf.backgroundColor=[UIColor clearColor];
        UILabel *la=(UILabel*)tap.view;
        la.backgroundColor=[UIColor lightGrayColor];
    }
    
}



- (void)handleSwipes:(UISwipeGestureRecognizer *)sender

{
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        z=z+1;
        if (z>zcount){
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最后一题了！" preferredStyle:  UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮的响应事件；
            }]];
            [self presentViewController:alert animated:true completion:nil];
            z=zcount;
        }
        else if (z>0){
            [self getrecord];
        }
    }
    //右滑
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
         if (z>1){
             z=z-1;
       
            [self getrecord];
        }
        else if(z==1)
        {
            
            [self getrecord];
            z=0;
        }
        else
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是第一题了！" preferredStyle:  UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮的响应事件；
            }]];
            [self presentViewController:alert animated:true completion:nil];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeColor{
    self.view.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
}
- (IBAction)zsave:(id)sender {
    // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Information" message:@"Hellworld" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    // [alert show];
  
}
- (IBAction)zleave:(id)sender {
    // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您好！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    // [alert show];
   
}

-(IBAction)setupData:(id)sender{
    z=z+1;
    if (z>0){
        [self getrecord];
    }
}
-(IBAction)perpareData:(id)sender{
    
    z=z-1;
    if (z>0){
        [self getrecord];
    }
}
-(void) getrecord{
    
    NSString *strcount1=[[NSString alloc] initWithFormat:@"%d",z];
    NSString *strcount2=@"/";
    NSString *strcount3=[[NSString alloc] initWithFormat:@"%d",zcount];
    // NSString *strcount3=[NSString stringWithUTF8String:zcount];
    NSString *strcount4 = [strcount1 stringByAppendingString:strcount2];
    NSString *strcount = [strcount4 stringByAppendingString:strcount3];
    labelcount.text=strcount;
    
    
    labela.backgroundColor=[UIColor clearColor];
    labelb.backgroundColor=[UIColor clearColor];
    labelc.backgroundColor=[UIColor clearColor];
    labeld.backgroundColor=[UIColor clearColor];
    labele.backgroundColor=[UIColor clearColor];
    labelf.backgroundColor=[UIColor clearColor];
    
    labelok.hidden=true;
    zduostr=@"";

  // NSString *zsql=[NSString stringWithFormat:@"select * from [1jczz] where rowid=%d",z];
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    NSString *zsql;
      if ([myDelegate.zindex intValue]==1){
        zsql = [NSString stringWithFormat:@"SELECT * from [1jczz] where rowid=%d",z];
        
    }
    else
    {
        zsql = [NSString stringWithFormat:@"SELECT * from [2xxjs] where rowid=%d",z];
        
    }
    
    const char *sql= [zsql cStringUsingEncoding:NSASCIIStringEncoding];
    sqlite3_stmt *stmt;
    int status = sqlite3_prepare_v2(sqlite2, sql, -1, &stmt, NULL);
    if(SQLITE_OK ==status){
        labela.text=@"";
        labelb.text=@"";
        labelc.text=@"";
        labeld.text=@"";
        labele.text=@"";
        labelf.text=@"";
        labelok.text=@"";
        zlabel.text=@"";
        labela.hidden=true;
        labelb.hidden=true;
        labelc.hidden=true;
        labeld.hidden=true;
        labele.hidden=true;
        labelf.hidden=true;
        labelok.hidden=true;
        zlabel.hidden=true;
        // const char * sql="select * from tk";//查询sql语句
        
        //stmt用来取出查询结果
        
        // sqlite3_stmt *stmt=NULL;
        
        /*sqlite3_prepare_v2函数是准备要执行sql查询的一个函数，可以当做这个函数就是用来做sql查询之前的准备工作的，
         
         　　它也是返回一个枚举作为准备工作的结果，SQLITE_OK则代表准备工作ok
         
         　　sqlite3_prepare_v2需要传入5个参数，第一个参数是数据库引用即（sqlite3* _shop）,第二个参数是要执行的sql语句，第三个参数是sql语句的长度
         
         　　第四个参数是查询结果stmt的引用，查询完成后，查询结果将会存入该引用，第五个参数是指向无法使用的部分的指针，一般不会用到，给NULL就可以了
         
         　　*/
        
        // int status = sqlite3_prepare_v2(sqlite, sql, -1, &stmt, NULL);
        
        // if(status == SQLITE_OK)//准备成功，SQL语句正确
        
        // {
        
        /*sqlite3_step(stmt)函数将会执行查询并且将查询到的当前记录存入到stmt（sqlite3_stmt * 类型）中
         
         　　　　第一次执行sqlite3_step(stmt)将会将表中的第一条数据存入到stmt中，第二次执行sqlite3_step(stmt)将会把表中的第二条记录存入到stmt中
         
         　　也就是说，while(sqlite3_step(stmt)==SQLITE_ROW)将会一条一条的去读取表中的记录，而SQLITE_ROW枚举判断的是有读取到数据行的情况*/
        
        //  while(sqlite3_step(stmt) == SQLITE_ROW)//成功指向一条记录
        
        //   {
        
        //  Shop* shop=[[Shop alloc]init];//封装的实体
        
        /*sqlite3_column_xxxx函数：它用来读取数据行中不同类型的数据，该函数的返回值就是读取到得数据内容，
         
         　　　　　　该函数需要2个参数，第一个参数是存放数据的stmt，第二个参数是数据列下标*/
        
        // shop.pid= sqlite3_column_int(stmt, 0);//读取stmt中存储的第0列数据
        
        sqlite3_step(stmt);
        
        
        const char* pname= (const char*)sqlite3_column_text(stmt, 2);//读取stmt中存储的第1列数据
        // tfUserName.text=[NSString stringWithUTF8String:pname];
        // _zlabel.text=[NSString stringWithUTF8String:pname];
        
        NSString *str1=[[NSString alloc] initWithFormat:@"%d",z];
        NSString *str2=@"、";
        NSString *str3=[str1 stringByAppendingString:str2];
        NSString *str = [NSString stringWithUTF8String:pname];
        
        NSString *zstr1 = [str3 stringByAppendingString:str ];
        
        const char* zstyle= (const char*)sqlite3_column_text(stmt, 11);//读取stmt中存储的第2列数据
        NSString *zstyle1=@"(";
        NSString *zstyle2=@")";
        NSString *zstyle3 = [NSString stringWithUTF8String:zstyle];
        NSString *zstr2 = [zstyle1 stringByAppendingString:zstyle3 ];
      
        NSString  *zstr3 = [zstr2 stringByAppendingString:zstyle2];
        
          NSString *zstr4 = [zstr3 stringByAppendingString:strcount];
        NSString *zstr5=[zstr4 stringByAppendingString:zstr1];
        
        NSMutableAttributedString *zstr6 = [[NSMutableAttributedString alloc] initWithString:zstr5];
        
        [zstr6 addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0,7)];
          [zstr6 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(7,strcount.length)];
       // zlabel.attributedText=[strcount stringByAppendingString:zstr5];
        zlabel.attributedText=zstr6;
        zlabel.hidden=false;
        
        if (sqlite3_column_text(stmt, 3)!=NULL)
        {
            const char* zlbla = (const char*)sqlite3_column_text(stmt, 3);//读取stmt中存储的第2列数据
            NSString *str1=@"A、";
            NSString *str = [NSString stringWithUTF8String:zlbla];
            labela.text= [str1 stringByAppendingString:str];
            labela.hidden=false;
            
        }
        if (sqlite3_column_text(stmt, 4)!=NULL)
        {
            const char* zlblb = (const char*)sqlite3_column_text(stmt, 4);//读取stmt中存储的第2列数据
            NSString *str1=@"B、";
            NSString *str = [NSString stringWithUTF8String:zlblb];
            labelb.text= [str1 stringByAppendingString:str];
            labelb.hidden=false;
        }
        if (sqlite3_column_text(stmt, 5)!=NULL)
        {
            const char* zlblc = (const char*)sqlite3_column_text(stmt, 5);//读取stmt中存储的第2列数据
            NSString *str1=@"C、";
            NSString *str = [NSString stringWithUTF8String:zlblc];
            labelc.text= [str1 stringByAppendingString:str];
            labelc.hidden=false;
        }
        if (sqlite3_column_text(stmt, 6)!=NULL)
        {
            const char* zlbld = (const char*)sqlite3_column_text(stmt,6);//读取stmt中存储的第2列数据
            NSString *str1=@"D、";
            NSString *str = [NSString stringWithUTF8String:zlbld];
            labeld.text= [str1 stringByAppendingString:str];
            
            labeld.hidden=false;
        }
        if (sqlite3_column_text(stmt, 7)!=NULL)
        {
            const char* zlble = (const char*)sqlite3_column_text(stmt, 7);//读取stmt中存储的第2列数据
            NSString *str1=@"E、";
            NSString *str = [NSString stringWithUTF8String:zlble];
            labele.text= [str1 stringByAppendingString:str];
            labele.hidden=false;
        }
        if (sqlite3_column_text(stmt, 8)!=NULL)
        {
            const char* zlblf = (const char*)sqlite3_column_text(stmt, 8);//读取stmt中存储的第2列数据
            NSString *str1=@"F、";
            NSString *str = [NSString stringWithUTF8String:zlblf];
            labelf.text= [str1 stringByAppendingString:str];
            labelf.hidden=false;
        }
        if (sqlite3_column_text(stmt, 12)!=NULL)
        {
            const char* zlblok = (const char*)sqlite3_column_text(stmt, 12);//读取stmt中存储的第2列数据
            NSString *str1=@"答案：";
            NSString *str = [NSString stringWithUTF8String:zlblok];
            labelok.text= [str1 stringByAppendingString:str];
            
        }
        if (sqlite3_column_text(stmt, 11)!=NULL)
        {
            const char* zlblok = (const char*)sqlite3_column_text(stmt, 11);//读取stmt中存储的第2列数据
            // NSString *str1=@"";
            NSString *str = [NSString stringWithUTF8String:zlblok];
            zlabelstyle.text= str;
            
        }
        
        sqlite3_close(sqlite2);
        
    }
}

@end
