# Swift版本: [LQSortTool-Swift](https://github.com/LQi2009/LQSortTool-Swift)

# 介绍
LZSortTool是一个分组排序工具,对排序操作进行了简单的封装,只需将所需排序的内容放在数组传过去即可;
对外接口中,预留了两个方法,分别是对字符串内容进行排序,和对NSObject对象(一般是我们创建的数据模型model)进行排序
```Objective-C
/**
 *  @author LQQ, 16-08-20 14:08:26
 *
 *  对一组字符串,按照首个字符的首字母进行分组排序
 *
 *  @param sourceArray 待分组排序的字符串集合集合
 *  @param sortType 排序结果的类型
 *
 *  @return 返回一个排序分组后的数组
 */
+ (nullable NSArray*)sortStrings:(nonnull NSArray<NSString *>*)sourceArray withSortType:(LZSortResultType)sortType;

/**
 *  @author LQQ, 16-08-20 14:08:19
 *
 *  对一组NSObject的子类对象(一般是model模型)按某个属性进行排序
 *
 *  @param sources 含有model的数组
 *  @param key 排序依据,必须是model的一个字符串属性,不能为nil
 *  @param sortType 排序结果的类型
 *
 *  @return 返回排序结果(含有model)
 */
+ (nullable NSArray *)sortObjcs:(nonnull NSArray <NSObject *>*)sources byKey:(nonnull NSString *)key withSortType:(LZSortResultType)sortType;
```
这里的参数都有说明,直接看注释即可;
另外LZSortResultType是设置返回的结果类型,这里我给了两种:
- 一种是不含排序后的索引的
  排序的结果数组中含有的元素为数组,内含数组中的内容是分组后的元素

- 一种是含有排序后的索引的
  排序的结果数组中含有的元素为字典,字典包含两个字段,分别对应索引和该索引的分组(数组)

当返回含有索引时,由于返回的结果数组中是字典,为便于取值,这里我将这两个字段的key值进行了预定义:
```Objective-C
/** 返回的排序后的结果字典中,序号对应的key */
 static NSString  const * _Nonnull  LZSortToolKey = @"LZSortToolKey";

/** 返回的排序后的结果字典中,value对应的key*/
static NSString const * _Nonnull LZSortToolValueKey = @"LZSortToolValueKey";
```
在取值的时候,直接使用这个预定义的key即可;
```
NSArray *arr = [dic objectForKey:LZSortToolValueKey]
```

# 集成
##### 手动添加

手动添加非常简单,只需将文件夹LZSortClass拖到自己工程, 然后在需要的地方引入头文件:

##### cocoapods添加

如果使用cocoapods管理, 可以在Podfile文件添加以下代码即可:
```
pod 'LZSortTool'
```

# 使用

引入头文件
```
#import "LZSortTool.h"
```
### 对字符串进行排序
```
- (NSMutableArray *)nameArray {
    if (!_nameArray) {
        _nameArray = [[NSMutableArray alloc]initWithObjects:@"鲁迅",@"###",@"刘一",@"赵四",@"钱",@"李三",@"孙五",@"王二",@"黄蓉",@"孙悟空",@"哪吒",@"李天王",@"范冰冰",@"赵丽颖",@"霍建华",@"黄晓明",@"成龙",@"李连杰",@"李小龙",@"曾小贤",@"LiShan", nil];
    }
    
    return _nameArray;
}


NSArray *arr = [LZSortTool sortStrings:self.nameArray withSortType:LZSortResultTypeSingleValue];
NSArray *arr1 = [LZSortTool sortStrings:self.nameArray withSortType:LZSortResultTypeDoubleValues];
```
这样即可获取到分组排序的结果;
### 对NSObject进行排序
首先,定义一个模型:
```
#import <Foundation/Foundation.h>

@interface People : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)NSInteger age;
@end
```
创建数据源:
```
NSMutableArray *pArray = [NSMutableArray arrayWithCapacity:0];
    for (NSString *str in self.nameArray) {
        People *p = [[People alloc]init];
        p.name = str;
        p.age = arc4random()%90 + 10;
        
        [pArray addObject:p];
    }
```
排序:
```
NSArray *pArr = [LZSortTool sortObjcs:pArray byKey:@"name" withSortType:LZSortResultTypeDoubleValues];
```
# 示例图
字符串排序,直接查看控制台输出吧,这里只给出模型排序的截图:
![模型排序示例图](https://github.com/LQQZYY/LZSortTool/blob/master/示例图.png)
