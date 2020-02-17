# Bloc - Provider
Link Provider (4.0.4): https://pub.dev/packages/provider

## Provider

### How to use [Provider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/basic.dart):
* **C1**: Use keyword `Consumer`
```javascript
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) => Text(user.name),
    );
  }
```
* **C2**: Use keyword `Provider.of`
```javascript
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Container(
      child: Text(user.name),
    );
  }
```
### Use [ChangeNotifierProvider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_change_notifier.dart):
![ChangeNotifierProvider](/images/ChangeNotifierProvider.png)
