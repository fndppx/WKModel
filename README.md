#WKModel
一行代码实现字典转模型。

##演示
**pod 'WKModel'** 并 **#import \<NSObject+WKModel.h>**

--

构造字典：

	NSDictionary *detail1 = @{@"food":@"Rice", @"drink":@"Juice"};
    NSDictionary *detail2 = @{@"food":@"Noodles", @"drink":@"Tea"};

    NSArray *arr = @[detail1, detail2];
    
    NSDictionary *dict = @{	@"name":@"Welkin", 
    					    @"age":@22, 
    						@"phone":@"110", 
    						@"detail":detail1, 
    						@"list":arr};
    
**一行代码转模型**：

	Model *model = [Model wk_modelFromDictionary:dict];
	
**结果**：

![()](http://7xneqd.com1.z0.glb.clouddn.com/model.jpg
)

---

##特殊情况：
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
	
###字典中key与对应的属性名字不同：
需在模型中实现如下方法，指明key对应的属性名：

	- (NSDictionary *)renamedProperties {
	    return @{@"id":@"ID", @"pro":@"property"};
	}

####具体详情参考demo :)
--
###V1.1
* 添加更改字典中key对应的属性名的方法。

###V1.0.1
* 修改了模型的初始化方法名。
* 添加了一行代码实现JSON字符串转模型的方法。


##许可
**WKModel** is released under [__MIT License__](https://github.com/WelkinXie/WKModel/blob/master/LICENSE).