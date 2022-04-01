#Dart web server hakkında 
      
    Şuan için bir veri tabanı bağlamadım. Bir listenin için de tutuyorum max 10 kısaltılmış link bulunabiliyor.
    Domain'im çok kısa olmadığı için kısaltılmış linkler tersine normal linklerden daha uzun olabiliyor :).
    
 #Genel request'ler
    
    var mainUrl = 'https://shorten-tr-bijetgd65q-uw.a.run.app'; ('Servisin main url\'i');
    her zaman açık olan link mainUrl +'/test';
    bir kısaltılmış linki tarayıcı da arratığınızda bir html karşılıyor ve Open Link butonu ile adrese gidilebiliyor.
    Tüm tutulan linkler mainUrl + '/getAll';
    
    yeni link eklemek için mainUrl + '/short'; POST  body {"link":"link.com"}
    
    apk'yı ve server'ın kodlarını for_test dosyasına ekledim, test edebilirsiniz. 
    
  #Herhangi bir sıkıntı çıkarsa issue açabilirseniz sevinirim.
