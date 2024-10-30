### ImageProvider子类

```
AssetBundleImageProvider 
FileImage 
MemoryImage 
NetworkImage 
ResizeImage 
ScrollAwareImageProvider
```

### 函数

```
createStream(ImageConfiguration configuration) → ImageStream
evict({ImageCache cache, ImageConfiguration configuration: ImageConfiguration.empty}) → Future<bool>
load(T key, DecoderCallback decode) → ImageStreamCompleter
obtainCacheStatus({ImageConfiguration configuration, ImageErrorListener handleError}) → Future<ImageCacheStatus>
obtainKey(ImageConfiguration configuration) → Future<T>
resolve(ImageConfiguration configuration) → ImageStream
resolveStreamForKey(ImageConfiguration configuration, ImageStream stream, T key, ImageErrorListener handleError) → void
```

- 其他