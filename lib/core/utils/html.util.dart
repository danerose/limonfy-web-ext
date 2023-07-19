import 'package:html/dom.dart' as htmldom;
import 'package:limonfy/core/constants/limonfy.constants.dart';

class HtmlUtils {
  static String? _getTitleFromHeader(
    htmldom.Element? head,
  ) {
    return head?.querySelector('title')?.text;
  }

  static String? _getSiteNameFromMetaProperty(
    htmldom.Element? head,
  ) {
    const query = 'meta[property="og:site_name"]';
    return head?.querySelector(query)?.attributes['content'];
  }

  static String _getSiteNameFromUrl(String url) {
    final name = Uri.parse(url).host.replaceAll('www.', "");
    return name;
  }

  static String? _getFavIcoFromHeader(
    htmldom.Element? head,
  ) {
    return head?.querySelector('link[rel="icon"]')?.attributes['href'];
  }

  static String? _getDesFromMetaProperty(
    htmldom.Element? head,
  ) {
    const query = 'meta[property="og:description"]';
    return head?.querySelector(query)?.attributes['content'];
  }

  static String? _getDesFromMetas(
    List<htmldom.Element> metas,
  ) {
    late String? description = '';
    for (htmldom.Element tag in metas) {
      if (tag.attributes['name'] == 'description') {
        description = tag.attributes['content'];
      }
    }
    return description == '' ? null : description;
  }

  static String? _getOgImageFromMetaProperty(
    htmldom.Element? head,
  ) {
    const query = 'meta[property="og:image"]';
    return head?.querySelector(query)?.attributes['content'];
  }

  //Public

  static String getTitle(
    htmldom.Element? head,
  ) {
    final title = _getTitleFromHeader(head);
    if (title != null) {
      return title;
    }
    return _getSiteNameFromMetaProperty(head) ?? 'Limonfy App';
  }

  static String getSiteName(
    htmldom.Element? head,
    String url,
  ) {
    final site = _getSiteNameFromMetaProperty(head);
    if (site != null) {
      return site;
    }
    return _getSiteNameFromUrl(url);
  }

  static String getFavIco(
    htmldom.Element? head,
  ) {
    return _getFavIcoFromHeader(head) ?? LimonfyConstants.urlIcon;
  }

  static String getDescription(
    String url,
    htmldom.Element? head,
    List<htmldom.Element> metas,
  ) {
    final des = _getDesFromMetaProperty(head) ?? _getDesFromMetas(metas);
    return des ?? getTitle(head);
  }

  static String getImage(
    htmldom.Element? head,
  ) {
    final image = _getOgImageFromMetaProperty(head);
    return image ?? LimonfyConstants.urlBanner;
  }
}
