class CourseVideo {
  final String id;
  final String title;
  final String url;
  final bool isDownloaded;
  final int downloadedBytes;
  final String localFilePath;

  const CourseVideo({
    required this.id,
    required this.title,
    required this.url,
    this.isDownloaded = false,
    this.downloadedBytes = 0,
    this.localFilePath = '',
  });
}