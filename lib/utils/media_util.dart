class MediaUtil {
  static bool isMediaRemote(String url) {
    return url.startsWith("http://") || url.startsWith("https://");
  }
}
