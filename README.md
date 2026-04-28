# Casper Excalibur G900 Custom Fn Lock & Brightness OSD

Casper Excalibur dizüstü bilgisayarlar için donanımsal olarak bulunmayan **"Fn Lock" (Fonksiyon Kilidi)** özelliğini yazılımsal olarak ekleyen ve cihazın kendi HotkeyOSD sürücüsünün ekrana yansıtmadığı **Parlaklık (Brightness) arayüzünü** şık bir OSD (On-Screen Display) ile ekrana getiren AutoHotkey v2 betiğidir. Bu versiyon, özel bir klavye dizilimi için tasarlanmıştır.

⚠️ **Uyarı:** Bu betik AutoHotkey v2 gerektirir ve özel klavye kısayolları içerir. Diğer notebook modellerinde denenmemiştir.

---

## 🌟 Özellikler

* **Fn Lock:** `Scroll Lock` (Fn + NumLock) tuşuna basarak Fn tuşlarına basılı tutmanıza gerek kalmadan medya ve sistem kısayollarını kullanabilirsiniz.
* **Özel Parlaklık OSD'si:** Cihazın kendi sürücülerinde eksik olan parlaklık çubuğunu; gri arka plana ve beyaz güneş logosuna sahip modern bir arayüzle ekrana yansıtır.
* **Özel Kısayol Haritası (Scroll Lock Açıkken):**
    * `F1`: Boş Kısayol kendiniz atama yapabilirsiniz.
    * `F2`: Boş Kısayol kendiniz atama yapabilirsiniz.
    * `F3`: Projeksiyon/Ekran Seçenekleri (Win + P)
    * `F4`: Parlaklığı Azalt (-10)
    * `F5`: Parlaklığı Artır (+10)
    * `F6`: Sesi Kapat (Mute)
    * `F7`: Sesi Kıs
    * `F8`: Sesi Aç
    * `F9`: Oynat / Duraklat
    * `F10`: Medyayı Durdur
    * `F11`: Önceki Medya
    * `F12`: Sonraki Medya
    * `Numpad /` : Home
    * `Numpad *` : End (Bu ikisini işlevsel bulduğum için ekledim dilerseniz koddan silip o tuşları normal fonksiyonuyla kullanabilirsinz)

---

## 🛠️ Gereksinimler

1.  **AutoHotkey v2:** Bu betik AHK v2 standartlarında yazılmıştır. Bilgisayarınızda [AutoHotkey v2](https://www.autohotkey.com/) yüklü olmalıdır.
2.  **Sürücüler:** Sisteminizin stabil çalışması için cihazınıza ait orijinal sürücülerin kurulu olması tavsiye edilir.

---

## ⚙️ Kurulum ve Otomatik Başlatma

Parlaklık ayarlarının WMI üzerinden kontrol edilebilmesi için uygulamanın **Yönetici Yetkileriyle** çalıştırılması gerekir. Windows her açıldığında arka planda otomatik başlaması için **Görev Zamanlayıcı (Task Scheduler)** kullanılması tavsiye edilir:

1. Başlat menüsüne **Görev Zamanlayıcı** yazıp açın ve **Görev Oluştur...** seçeneğine tıklayın.
2. **Genel** sekmesinde bir isim verin ve **"En yüksek ayrıcalıklarla çalıştır"** kutucuğunu işaretleyin.
3. **Tetikleyiciler** sekmesinde yeni tetikleyici olarak **"Oturum açıldığında"** seçeneğini seçin.
4. **Eylemler** sekmesinde eylem olarak "Program başlat" seçin. Program kısmına `AutoHotkey64.exe` dosyasının yolunu gösterin. Argümanlar kısmına indirdiğiniz `Fn_Lock.ahk` dosyasının tam dosya yolunu yazın.
5. **Koşullar** sekmesinde "Görevi yalnızca bilgisayar AC gücündeyse başlat" seçeneğindeki **işareti kaldırın**.
6. Kaydedin. Artık betik arka planda sessizce çalışacaktır.

---

## 🎨 OSD Özelleştirme

Ekrana gelen parlaklık göstergesini özelleştirmek isterseniz `Fn_Lock.ahk` dosyasını düzenleyerek `MAIN OSD CONFIGURATION` başlığı altındaki değerleri değiştirebilirsiniz:

* `OSD_W` ve `OSD_H`: Kutunun genişliği (146) ve yüksekliği (134).
* `OSD_X` ve `OSD_Y`: Kutunun ekrandaki X (887) ve Y (819) konumu.
* `Fade_Speed`: Animasyon hızı (25 olarak ayarlanmıştır).
