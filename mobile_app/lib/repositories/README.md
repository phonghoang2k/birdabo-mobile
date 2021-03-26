## Write Repository there, separate by directory.

View -> Controller -> Service -> Repository -> ApiBE

e.g
  ```dart
class SampleRepository {
  static Future<dynamic> sampleFunction(Map<String, dynamic> params) {
    return Application.api.get('sampleApiUrl', params);
  }

}
```
