# CCRouter
iOS项目URL跳转组件，支持携带参数

### 用途
1、避免页面中直接导入头文件push或present下一个页面
2、页面跳转可以由服务器控制
### 用法
> pod 'CCRouter'

1、第一种URL种携带参数（例ios://firstpage?title=标题&tips=第二个参数）
> 注册
```
[[CCRouter sharedInstance] registerBlock:^(NSDictionary *param) {
        FirstViewController *firstVC = [[FirstViewController alloc] init];
        firstVC.strTitle = param[@"title"];
        firstVC.strTips = param[@"tips"];
        UINavigationController *navc = [UIViewController currentViewController].navigationController;
        [navc pushViewController:firstVC animated:YES];
    } forRoute:@"ios://firstpage"];
```

> 调用

```
[[CCRouter sharedInstance] handleRoute:@"ios://firstpage?title=url带参&tips=这是第二个参数"];

```

2、第二种参数单独传递

> 注册

```
[[CCRouter sharedInstance] registerDictionaryParamBlock:^(NSDictionary *params) {
        SecondViewController *secondVC = [[SecondViewController alloc] init];
        secondVC.strTitle = params[@"title"];
        secondVC.strTips = params[@"tips"];
        UINavigationController *navc = [UIViewController currentViewController].navigationController;
        [navc pushViewController:secondVC animated:YES];
    } forRoute:@"ios://secondpage"];
```

> 调用

```
NSDictionary *dict = @{
                        @"title":@"参数传递",
                        @"tips":@"这是第二个参数"
                       };
[[CCRouter sharedInstance] handleRoute:@"ios://secondpage" parameter:dict];
```

