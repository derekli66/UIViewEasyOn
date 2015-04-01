# UIViewEasyOn
The reason why to create this EasyOn category is make programmatic creation of subviews more instinct and more readable. 

## How to use
There are two ways to use this category

### Method 1
---
Create adding subview methods in UIView+AddSubview.h and follow this format,

    - (id)add<subclassNameOfUIView>:(UIViewCreationBlock)aBlock;

```objective-c
@interface UIView (AddSubviews)
- (id)addUIView:(UIViewCreationBlock)aBlock;
- (id)addUILabel:(UIViewCreationBlock)aBlock;
- (id)addUIImageView:(UIViewCreationBlock)aBlock;
- (id)addUIScrollView:(UIViewCreationBlock)aBlock;
- (id)addUITextField:(UIViewCreationBlock)aBlock;
@end
```

After adding subview methods are created, there is no need to implement those methods. The EasyOn category will create one for you. The reset of your works are focus on the view's property adjustment.

### Method 2
---
Add subviews with 'add' block

```objective-c
contentView.add([UILabel class], ^(UILabel *aLabel) {
    aLabel.frame = CGRectMake(0.0f, 0.0f, 200.0f, 20.0f);
    aLabel.backgroundColor = [UIColor blackColor];
    aLabel.textColor = [UIColor lightTextColor];
    aLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    aLabel.text = @"Added UILabel successfully";
});
```

## Usual style

```objective-c
UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(10.0f, 20.0f, 200.0f, 200.0f)];
contentView.backgroundColor = [UIColor lightGrayColor];
    
UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 20.0f)];
aLabel.backgroundColor = [UIColor blackColor];
aLabel.textColor = [UIColor lightTextColor];
aLabel.font = [UIFont boldSystemFontOfSize:14.0f];
aLabel.text = @"Added UILabel successfully";
    
[contentView addSubview:aLabel];
[self.view addSubview:contentView];
```

## New style

```objective-c
[self.view addUIView:^(UIView *contentView) {
    contentView.frame = CGRectMake(10.0f, 20.0f, 200.0f, 200.0f);
    contentView.backgroundColor = [UIColor lightGrayColor];
    
    contentView.add([UILabel class], ^(UILabel *aLabel) {
        aLabel.frame = CGRectMake(0.0f, 0.0f, 200.0f, 20.0f);
        aLabel.backgroundColor = [UIColor blackColor];
        aLabel.textColor = [UIColor lightTextColor];
        aLabel.font = [UIFont boldSystemFontOfSize:14.0f];
        aLabel.text = @"Added UILabel successfully";
    });
}];
```