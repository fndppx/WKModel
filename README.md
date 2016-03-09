#WKModel
一行代码实现字典转模型。

##演示
构造字典：

	NSDictionary *detail1 = @{@"food":@"Rice", @"drink":@"Juice"};
    NSDictionary *detail2 = @{@"food":@"Noodles", @"drink":@"Tea"};

    NSArray *arr = @[detail1, detail2];
    
    NSDictionary *dict = @{@"name":@"Welkin", @"age":@22, @"phone":@"110", @"detail":detail1, @"list":arr};
    
**一行代码转模型**：

	Model *model = [[Model alloc] initWithDictionary:dict];
	
**结果**：

![()](http://7xneqd.com1.z0.glb.clouddn.com/model.jpg
)

---
###模型中包含模型
需在模型中实现如下方法，指明其中包含的模型类型：

	- (NSDictionary *)objectProperties {
    	return @{@"detail":[Detail class]};
	}
	
###模型中包含模型数组：
需在模型中实现如下方法，指明数组中模型的类型：

	- (NSDictionary *)arrayProperties {
    	return @{@"list":[Detail class]};
	}

####具体详情参考demo :)
##许可
**WKModel** is released under [__MIT License__](https://github.com/WelkinXie/WKModel/blob/master/LICENSE).