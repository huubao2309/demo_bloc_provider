# Bloc - Provider
**Link**: - Provider (4.0.4): https://pub.dev/packages/provider

          - Bloc (3.0.0): https://pub.dev/packages/bloc

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
* **C1**: 
  ```javascript
    @override
    Widget build(BuildContext context) {
      Counter1 counter1 = Provider.of<Counter1>(context);
      Counter2 counter2 = Provider.of<Counter2>(context);
      ...
  ```
* **C2**: 
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
### Use [ValueNotifier](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_value_listenable_provider.dart):
![ValueNotifier](/images/ValueNotifier.png)

### Use [Proxy Provider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_proxy_provider.dart):

(Use for `Dependency Injection`)

![ProxyProvider](/images/ProxyProvider.png)

#### Use Proxy Provider:
  ```javascript
     @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>.value(
      value: CounterModel(counterService: Provider.of(context)),
      child: Consumer<CounterModel>(
        builder: (context, model, child) => Center(
        ...
        ),
      ...
  ```
* Method `ProxyProvider` can inject 6 method `ProxyProvider1, ProxyProvider2, ..., ProxyProvider6`
  ```javascript
     ProxyProvider3<CounterApi1, CounterApi2, CounterApi3, CounterService>
  ```

### Use [Future Provider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_future_provider.dart):
![Future Provider](/images/FutureProvider.png)

### Use [Stream Provider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_stream_provider.dart):
![Stream Provider](/images/StreamProvider.png)

## BLOC

## BLOC - Provider
