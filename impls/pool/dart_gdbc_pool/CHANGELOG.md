## 0.0.6
- fix: Prevent connection objects that fail to connect from entering the connection pool.
  > 阻止连接失败的连接对象进入连接池
- chore: upgrade dependencies, add `onClose` callback to `Connection` to allow custom cleanup logic when the connection is closed.
  > 适配上游项目支持的新特性，支持传入连接关闭时的回调函数

## 0.0.5
- chore: upgrade dependencies.

## 0.0.4+1
- chore: upgrade dependencies.

## 0.0.4
- Feat: Add timestamp type.

## 0.0.3
- Feat: ExecutionPlan support.

## 0.0.2+2
- fix: close connection when connection is old.

## 0.0.2+1
- chore: upgrade dependencies.

## 0.0.2

- Feat: Connection pool support.
