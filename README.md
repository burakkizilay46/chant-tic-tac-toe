# Chant Tic-Tac-Toe Game

**Geliştirici:** [kizilay4696@gmail.com](mailto:kizilay4696@gmail.com)

## Proje Açıklaması

**Chant Tic-Tac-Toe**, klasik tic-tac-toe oyununun Flutter kullanılarak geliştirilmiş modern bir versiyonudur. Bu uygulama, Firebase ile gerçek zamanlı veri yönetimi, Provider State Management ile durum yönetimi ve Shared Preferences ile yerel önbellekleme gibi çeşitli teknolojileri entegre ederek kullanıcı dostu bir oyun deneyimi sunar.

## Özellikler

- **Gerçek Zamanlı Çok Oyunculu:** Firebase Realtime Database kullanılarak, oyuncular arasında senkronize bir oyun deneyimi sunulur.
- **Durum Yönetimi:** Provider State Management kullanılarak, uygulama boyunca oyun durumu ve kullanıcı bilgileri verimli bir şekilde yönetilir.
- **Yerel Önbellekleme:** Shared Preferences kullanılarak, kullanıcı bilgileri ve diğer uygulama verileri cihazda yerel olarak saklanır.
- **Kullanıcı Dostu Arayüz:** Temiz ve modern bir arayüz ile kolay kullanım sağlar.

## Kullanılan Teknolojiler

- **Flutter:** Uygulamanın temel geliştirme platformu.
- **Provider State Management:** Uygulama durumunu yönetmek ve widget'lar arasındaki durumu paylaşmak için kullanılır.
- **Firebase Realtime Database:** Oyun durumu ve kullanıcı bilgilerini gerçek zamanlı olarak senkronize etmek için kullanılır.
- **Shared Preferences:** Kullanıcı bilgilerini ve uygulama ayarlarını yerel olarak saklamak için kullanılır.

## Yapı

- **Base Provider:** Tüm provider'lar için kullanılan temel yapı.
- **Base View:** Her sayfa için oluşturulmuş provider'ı temel alarak, tüm iş mantığının (business logic) provider içerisinde yapılması amaçlanmıştır. Bu yapı, sayfa ile ilgili işlemleri daha modüler ve yönetilebilir kılar.
- **GameProvider:** Oyun mantığını ve durumu yöneten provider. Bu sınıf, oyun sırasını, oyuncu hamlelerini ve oyun durumunu kontrol eder.
- **SharedPrefsManager:** Shared Preferences ile yerel verileri yönetmek için kullanılan Singleton sınıf. Kullanıcı verilerini ve ayarlarını cihazda kalıcı olarak saklar.
- **FirebaseService:** Firebase ile etkileşimi yöneten hizmet sınıfı. Bu sınıf, Firebase'den veri çekme, veri güncelleme ve veri ekleme işlemlerini yönetir.

## Kurulum

1. **Depoyu Klonlayın:**
    ```bash
    git clone https://github.com/your-repo/chant-tic-tac-toe.git
    cd chant-tic-tac-toe
    ```

2. **Gereksinimleri Yükleyin:**
    ```bash
    flutter pub get
    ```

3. **Firebase'i Yapılandırın:**
   - Firebase Console'da bir proje oluşturun ve Flutter uygulamanızı bu projeye ekleyin.
   - `google-services.json` (Android) ve `GoogleService-Info.plist` (iOS) dosyalarını uygun yerlere ekleyin.

4. **Uygulamayı Çalıştırın:**
    ```bash
    flutter run
    ```

## Kullanım

Uygulamayı başlattıktan sonra:

1. **Kullanıcı Girişi:** Uygulama ilk kez başlatıldığında, kullanıcı bilgilerini girin.
2. **Oyuna Katılma:** Mevcut bir oyuna katılın veya yeni bir oyun başlatın.
3. **Hamle Yapma:** Sıra sizdeyken, oyunun tahtasında bir kare seçin.
4. **Oyun Sonucu:** Oyun bittiğinde kazananı veya beraberliği görürsünüz.

## Katkıda Bulunma

Bu projeye katkıda bulunmak isterseniz, lütfen bir pull request oluşturun veya önerileriniz için bir issue açın. Her türlü katkı ve geri bildirime açığız.

## İletişim

Herhangi bir soru veya öneriniz varsa, lütfen [kizilay4696@gmail.com](mailto:kizilay4696@gmail.com) adresine e-posta gönderin.
