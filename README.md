Chant Tic-Tac-Toe Game
Geliştirici: kizilay4696@gmail.com

Proje Açıklaması
Chant Tic-Tac-Toe, klasik tic-tac-toe oyununun Flutter kullanılarak geliştirilmiş modern bir versiyonudur. Bu uygulama, Firebase ile gerçek zamanlı veri yönetimi, Provider State Management ile durum yönetimi, ve Shared Preferences ile yerel önbellekleme gibi çeşitli teknolojileri entegre ederek kullanıcı dostu bir oyun deneyimi sunar.

Özellikler
Gerçek Zamanlı Çok Oyunculu: Firebase Realtime Database kullanılarak, oyuncular arasında senkronize bir oyun deneyimi sunulur.
Durum Yönetimi: Provider State Management kullanılarak, uygulama boyunca oyun durumu ve kullanıcı bilgileri verimli bir şekilde yönetilir.
Yerel Önbellekleme: Shared Preferences kullanılarak, kullanıcı bilgileri ve diğer uygulama verileri cihazda yerel olarak saklanır.
Kullanıcı Dostu Arayüz: Temiz ve modern bir arayüz ile kolay kullanım sağlar.
Kullanılan Teknolojiler
Flutter: Uygulamanın temel geliştirme platformu.
Provider State Management: Uygulama durumunu yönetmek ve widget'lar arasındaki durumu paylaşmak için kullanılır.
Firebase Realtime Database: Oyun durumu ve kullanıcı bilgilerini gerçek zamanlı olarak senkronize etmek için kullanılır.
Shared Preferences: Kullanıcı bilgilerini ve uygulama ayarlarını yerel olarak saklamak için kullanılır.
Yapı
Base Provider: Tüm provider'lar için kullanılan temel yapı.
Base View: Sayfa için oluşturulmuş provider'ı base alarak bütün business logic'lerin provider içerisinde yapılması amaçlanmıştır.
GameProvider: Oyun mantığını ve durumu yöneten provider.
SharedPrefsManager: Shared Preferences ile yerel verileri yönetmek için kullanılan Singleton sınıf.
FirebaseService: Firebase ile etkileşimi yöneten hizmet sınıfı.
