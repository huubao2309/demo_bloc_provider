# Bloc - Provider
**Link**: 
* Provider (4.0.4): https://pub.dev/packages/provider

============================================================================

## Menu Bloc - Provider:
### 1. [Provider](https://github.com/huubao2309/demo_bloc_provider#1-provider-1)
### 2. [BLOC (Business Logic Component)](https://github.com/huubao2309/demo_bloc_provider#2-bloc-business-logic-component-1)
### 3. [Bloc + Provider](https://github.com/huubao2309/demo_bloc_provider#3-bloc--provider-1)

============================================================================

## 1. Provider
(Remove using `SetState()`)

### a. How to use [Provider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/basic.dart):
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
### b. Use [ChangeNotifierProvider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_change_notifier.dart):
![ChangeNotifierProvider](/images/ChangeNotifierProvider.png)

### c. Use [MultiProvider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_multiple_provider.dart):
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
### d. Use [ValueNotifier](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_value_listenable_provider.dart):
![ValueNotifier](/images/ValueNotifier.png)

### e. Use [Proxy Provider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_proxy_provider.dart):

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

### f. Use [Future Provider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_future_provider.dart):
![Future Provider](/images/FutureProvider.png)

### g. Use [Stream Provider](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/provider/demo_stream_provider.dart):
![Stream Provider](/images/StreamProvider.png)

## 2. BLOC (Business Logic Component)
![BLOC](/images/bloc_diagram.png)
(**Note:** Don't use *Bloc* in *Bloc*)

[Source Bloc](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/bloc)

### Use Bloc
* [**At View**](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/bloc/search_box.dart):

```javascript
  class SearchBox extends StatefulWidget {
    final SearchBloc bloc;
    SearchBox({SearchBloc bloc}) : this.bloc = bloc;

    @override
    _SearchBoxState createState() => _SearchBoxState();
  }
  ...
```

```javascript
    searchController.addListener(() {
      widget.bloc.search(searchController.text); // handle 
    });
  ...
```

* [**At Bloc file**](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/bloc/search_bloc.dart):

```javascript
  search(String query) {
    if (query.isEmpty) {
      searchController.sink.add(dataSearch);
      return;
    }

    _filter(query).then((result) {
      // push value to Stream
      searchController.sink.add(result);
    });
  }
  ...
```
* [**And use display on View**](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/bloc/search_box.dart):

```javascript
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<String>>(
          initialData: [],
          stream: widget.bloc.searchController.stream,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return _buildRow(snapshot.data[index]);
                });
          }),
    );
  }
  ...
```

## 3. Bloc + Provider
### [**Source Bloc + Provider**](https://github.com/huubao2309/demo_bloc_provider/tree/master/demo_bloc_provider/lib/bloc_and_provider)
* [**Add Action at View**](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/bloc_and_provider/search_box.dart)

```javascript
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // get bloc on context
    var bloc = Provider.of<SearchBlocProvider>(context);
    searchController.addListener(() {
      bloc.search(searchController.text);
    });
  }
  ...
```
* [**Use Bloc + Provider**](https://github.com/huubao2309/demo_bloc_provider/blob/master/demo_bloc_provider/lib/bloc_and_provider/search_list_result.dart):

```javascript
    @override
    Widget build(BuildContext context) {
      return Consumer<SearchBlocProvider>(
        builder: (context, bloc, child) => Container(
          child: StreamBuilder<List<String>>(
              initialData: [],
              stream: bloc.searchController.stream,
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return _buildRow(snapshot.data[index]);
                    });
              }),
        ),
      );
    }
    ...
```


