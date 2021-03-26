## Write Service there, separate by directory.

View -> Controller -> Service -> Repository -> ApiBE

e.g
  ```dart
class SampleService {
  Future<SampleModel> sampleFunction(Map<String, dynamic> params) async {
    final response = await SampleRepository.sampleFunction(params);
    return (response.statusCode == 200)
        ? SampleModel.fromJson(response.data["result"] as Map<String, dynamic>)
        : throw SampleException;
  }
}
```
