# PHP Examples

PHP から REPOTEN-API が提供する PDF 生成API を使う場合のサンプルコード集です。

## XML

### 基本

  * [xml-basic.php](https://github.com/repoten-api/examples/blob/master/beta/php/xml-basic.php)  
    SSL + 公開テンプレート + XML サンプル（``PEAR HTTP/Request2.php`` が必要）
  * [xml-basic-nossl.php](https://github.com/repoten-api/examples/blob/master/beta/php/xml-basic-nossl.php)  
    非SSL + 公開テンプレート + XML サンプル

### 簡単な一覧表

> Comming Soon!

## JSON

  * [json-private-basic.php](https://github.com/repoten-api/examples/blob/master/beta/php/json-private-basic.php)  
    SSL + **非公開テンプレート** + JSON サンプル

いずれも [certificates.tlf](https://github.com/repoten-api/examples/blob/master/beta/templates/) テンプレートに対するサンプルコードです。
テンプレートの仕様は [ThinReports Editor](http://www.thinreports.org/download/) で開くか、同ディレクトリにある ``certificates.tlf.html`` をご覧下さい。
