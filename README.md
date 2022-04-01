#Grisoft Challenge
  
  Firstly ,I am still working for another company, so I didnt have so much time and I didnt complete code somewhere.
  1. Valid Link , You have to login like 'flutter.com' 
  2. I used provider , But i  used so little state management(for copying text and empty field).
  3. I didnt write test for whole apps (just for api).
  4. I have a windows computer so I couldnt test on ios.

As a techs
  - for caching , used Hive
  - network side , dio

Shorten Api Service gave certificate error , when i used my phone internet.
İf you will face the same problem , I can try to solve if you tell me

Veysel Sahin

--Update


Ne yaptığımı anlatmayı unuttum.

--Ui

Tek bir sayfa yaptım ve bunu 3 ana widget'a böldüm çünkü sadece üst kısım değişecekti.


Bir link girildiğin de eğer apiden başarılı response dönmüş ise Locale kaydettim(Hive).Üst kısım ValueListenable ile localde eğer bir data kayıtlı ise List halinde ki widget'a dönüşüyor.


Responsive kısmı olarak Başlangıcta Expanded kullandım böylece cihaz büyüklüğü ne olursa olsun ona göre şekillenecek.İçerdeki widgetlar için MediaQuery kullandım.Zaman bulamadğım için ek bir sınıf tutmayı unutmuşum. Bütün sayfalarda (MediaQuery.of(context).size) gibi mantıksız bir satır var.


--Bilgi (upgrade branch'i)


  Proje teslim tarihlerin de projemiz prod'a çıkmıştı ve  çok fazla zaman bulamamıştım.Şuan vakit bulunca bazı düzenlemeler yaptım
  
   1. Dart ile kendi kısaltma servisimi yazdım , yayınladım ve uygulamaya bağladım.(https://shorten-tr-bijetgd65q-uw.a.run.app) (upgrade readme'den okuyabilirsiniz)
   2. View model ekledim , fonksiyonları oraya aldım.
   3. size extension ekledim böylece her sayfada olan mediaquery satırı kalktı.
   4. ve bir kaç tane daha küçük düzeltme.


