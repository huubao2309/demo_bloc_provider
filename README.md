# Bloc - Provider
Link Provider (4.0.4): https://pub.dev/packages/provider

## Provider

### Use
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

