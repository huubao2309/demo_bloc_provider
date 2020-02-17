# Bloc - Provider
Link Provider (4.0.4): https://pub.dev/packages/provider

## Provider
(Remove using `SetState()`)

### How to use [Provider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/basic.dart):
* **C1**: Use keyword `Consumer`
```javascript
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) => Text(user.name),
    );
  }
```
* **C2**: Use keyword `Provider.of`
```javascript
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Container(
      child: Text(user.name),
    );
  }
```
### Use [ChangeNotifierProvider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_change_notifier.dart):
![ChangeNotifierProvider](/images/ChangeNotifierProvider.png)

### Use [MultiProvider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_multiple_provider.dart):
(Beacuse a program have many method `SetState()`)
```javascript
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Method1(),
        ),
        ChangeNotifierProvider(
          create: (_) => Method2(),
        ),
        ...
      ],
      child: TestWidget1(),
    );
  }
```
#### Call multi Provider:
* C1: 
  ```javascript
  @override
  Widget build(BuildContext context) {
    Counter1 counter1 = Provider.of<Counter1>(context);
    Counter2 counter2 = Provider.of<Counter2>(context);
    ...
```
* C2: 
  ```javascript
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Counter1>.value(value: Counter1()),
        Provider<Counter2>.value(value: Counter2()),
      ],
      child: Container(),
    );
    ...
```
