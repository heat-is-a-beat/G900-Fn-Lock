# Casper Excalibur G900 Custom Fn Lock & Brightness OSD

Casper Excalibur dizüstü bilgisayarlar için donanımsal olarak bulunmayan **"Fn Lock" (Fonksiyon Kilidi)** özelliğini yazılımsal olarak ekleyen ve cihazın kendi HotkeyOSD sürücüsünün ekrana yansıtmadığı **Parlaklık (Brightness) arayüzünü** şık bir OSD (On-Screen Display) ile ekrana getiren AutoHotkey v2 betiğidir. Bu versiyon, özel bir klavye dizilimi için tasarlanmıştır.

[cite_start]⚠️ **Uyarı:** Bu betik AutoHotkey v2 gerektirir [cite: 1] ve özel klavye kısayolları içerir. Diğer notebook modellerinde denenmemiştir.

---

## 🌟 Özellikler

* [cite_start]**Fn Lock:** `Scroll Lock` tuşuna basarak  Fn tuşlarına basılı tutmanıza gerek kalmadan medya ve sistem kısayollarını kullanabilirsiniz.
* [cite_start]**Özel Parlaklık OSD'si:** Cihazın kendi sürücülerinde eksik olan parlaklık çubuğunu; gri arka plana [cite: 7] [cite_start]ve beyaz güneş logosuna sahip [cite: 9] modern bir arayüzle ekrana yansıtır.
* **Özel Kısayol Haritası (Scroll Lock Açıkken):**
    * [cite_start]`F1`, `F2`, `F3`: Projeksiyon/Ekran Seçenekleri (Win + P) 
    * [cite_start]`F4`: Parlaklığı Azalt (-10) 
    * [cite_start]`F5`: Parlaklığı Artır (+10) 
    * [cite_start]`F6`: Sesi Kapat (Mute) 
    * [cite_start]`F7`: Sesi Kıs 
    * [cite_start]`F8`: Sesi Aç 
    * [cite_start]`F9`: Oynat / Duraklat 
    * [cite_start]`F10`: Medyayı Durdur 
    * [cite_start]`F11`: Önceki Medya 
    * [cite_start]`F12`: Sonraki Medya 
    * [cite_start]`Numpad /` : Home 
    * [cite_start]`Numpad *` : End 

---

## 🛠️ Gereksinimler

1.  [cite_start]**AutoHotkey v2:** Bu betik AHK v2 standartlarında yazılmıştır[cite: 1]. Bilgisayarınızda [AutoHotkey v2](https://www.autohotkey.com/) yüklü olmalıdır.
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

* [cite_start]`OSD_W` ve `OSD_H`: Kutunun genişliği (146) [cite: 2] [cite_start]ve yüksekliği (134)[cite: 4].
* [cite_start]`OSD_X` ve `OSD_Y`: Kutunun ekrandaki X (887) [cite: 5] [cite_start]ve Y (819) [cite: 6] konumu.
* [cite_start]`Fade_Speed`: Animasyon hızı (25 olarak ayarlanmıştır)[cite: 10].
