#SideMenuComponent

## Türkçe
Bu projede BaseViewController kullanarak uygulama genelinde tekrar eden yan menü ve özel navigasyon işlemlerini merkezi bir yapıya oturtarak yönetiyorum. Projede SnapKit, Hero ve Custom View yapılarıyla birlikte Enums ve Protocols gibi Swift'in önemli bileşenleri de yer alıyor.

##BaseViewController

BaseViewController, projede merkezi bir yapı sağlar ve tüm view controller'lar için ortak yan menü (menuView) ve özel navigation bar (customNavBar) içerir.
Menü durumu, Constants dosyasında tanımlanan MenuState enum'ı ile yönetilir (açık/kapalı).
Menü animasyonları UIView.animate ile dinamik olarak gerçekleştirilir. Menü açılıp kapanırken sayfalar arası geçiş akıcı bir şekilde yönetilir.
Sayfa geçişlerinde Hero kütüphanesi ile özel animasyonlar sağlanır. Hero.replaceViewController kullanılarak yeni sayfa zoom animasyonu ile sunulur.

##Constants
Proje genelinde kullanılacak menü seçenekleri için Constants.MenuOptions enum'ı tanımlıdır. Bu enum ile hangi sayfanın açılacağı kontrol edilir (örneğin, HomeVC, AchievementVC, TagsVC, SettingsVC).

##Özellikler
Custom Navigation Bar: Projede tekrar kullanılabilir ve özelleştirilebilir bir navigasyon bar sunar.
Yan Menü: Menü seçenekleri arasında gezinmeyi sağlar. Menü, açılıp kapanma animasyonları ile kullanıcı dostu bir deneyim sunar.
Hero Animasyonları: Sayfalar arası geçişlerde akıcı animasyonlar sağlanır.
Modüler Yapı: Enums ve Protocols kullanılarak modüler ve temiz bir kod yapısı oluşturulmuştur.

## English
In this project, I use BaseViewController to centrally manage recurring side menu and custom navigation operations throughout the application. The project includes SnapKit, Hero and Custom View structures, as well as important Swift components such as Enums and Protocols.

##BaseViewController
BaseViewController provides a centralized structure in the project and contains a common side menu (menuView) and a custom navigation bar (customNavBar) for all view controllers.
The menu state is managed by the MenuState enum defined in the Constants file (on/off).
Menu animations are performed dynamically with UIView.animate. The transition between pages is managed smoothly while the menu is opening and closing.
Special animations are provided with the Hero library for page transitions. New page is presented with zoom animation using Hero.replaceViewController.

##Constants
Constants.MenuOptions enum is defined for menu options to be used throughout the project. This enum controls which page to open (for example, HomeVC, AchievementVC, TagsVC, SettingsVC).

##Features
Custom Navigation Bar: Provides a reusable and customizable navigation bar in the project.
Side Menu: Allows navigation between menu options. The menu offers a user-friendly experience with opening and closing animations.
Hero Animations: Smooth animations are provided for transitions between pages.
Modular Structure: A modular and clean code structure has been created using Enums and Protocols.
