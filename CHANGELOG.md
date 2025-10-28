## 0.0.6
- Feat: Add `onClose` callback to `Connection` to allow custom cleanup logic when the connection is closed.
  > 在`Connection`类成员中添加`onClose`回调函数
- Feat: Add `decimal`, `zonedTime`, `embeddingVector`, and `zonedDateTime` types to support more complex data types.

## 0.0.5
- Feat: Refine the time type to fully adapt to the field definitions of different databases.
- Feat: Add `databaseName` field to `Connection` to hold the tablespace name.
- Feat: Add the code attribute to the exception types.


## 0.0.4+1
- Fix: fix bug that value missing when vertex has multiple tags.

## 0.0.4
- Feat: Add timestamp type.

## 0.0.3
- Feat: Add ExecutionPlan to ResultSet.

## 0.0.2+2
- fix: PoolConfig provides a constructor with parameters

## 0.0.2+1
- Fix bug: remove broken connection from pool.

## 0.0.2
- Feat: Connection pool support.

## 0.0.1+4
- Fix bug: remove jsonEncode from ResultSet toString() method.

## 0.0.1+3
- Change statement apis
- Support gql render in prepared statement

## 0.0.1+2

- Provided driver manager which can be used to register drivers and get a driver by its legal url

- Provided common types for graph databases

- Declared some base interfaces:
  - Driver
  - Connection
  - Statement
  - PreparedStatement
  - ResultSet
  - ...


