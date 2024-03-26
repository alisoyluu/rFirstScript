mydata <- read.csv("http://johnmuschelli.com/intro_to_r/data/Youth_Tobacco_Survey_YTS_Data.csv")  # URL adresini bildiğim bir data koleksiyonundaki veriyi, direkt olarak çekerek "mydata" ismiyle yeni bir veri olarak atadım.

getwd() # Hangi çalışma dizininde çalıştığımı görebilirim.

install.packages("readr")
library(readr)
head(mydata, 5) # Çektiğimiz data içinden istediğimiz kadar satır adedinin tüm sütunlar ile beraber çıktısını gözlemledim. Virgülden sonra 5 yazdığım için ilk 5 satırı verdi.

class(mydata) # Data içindeki class'ların türlerini gözlemledim.

nrow(mydata) # Data içindeki toplam satır sayısını verdi.

ncol(mydata) # Data içindeki toplam sütun sayısını verdi.

dim(mydata) # Aynı anda hem toplam satır hem de toplam sütun sayısını yanyana verdi.

colnames(mydata) # Data içindeki tüm sütun isimlerini sıraladı.

?dir # dir fonksiyonunun nasıl çalıştığını hatırlamak için dökümantasyonu açtım.
help("dir") # dir fonksiyonunun nasıl çalıştığını hatırlamak için dökümantasyonu diğer bir yol olarak bu şekilde açtım.

ls(mydata) # Çalışma alanımdaki anlık olarak değişkenlerin isimlerini gösterdi.

install.packages("tidyverse")
head(mydata) # Datamızın içindeki ilk 6 satıra ait bilgileri verdi.

tbl = as_tibble(mydata) 
head(tbl) # Datamızın içindeki ilk 6 satıra ait bilgileri verdi.Ancak bu sefer her bir sütunu karakter bilgisiyle beraber verdi.

head(mydata,2) # İlk 2 satırı verdi.

mydata = dplyr::rename(mydata, YIL = year) # Datamızın içindeki year değişkeninin ismini "YIL" olarak değiştirdim.

mydata$YIL # Datamızın içindeki YIL değişkenini çağırdım.

mydata_upper = dplyr::rename_all(mydata, toupper) # mydata verisetimiz içindeki tüm değişkenlerin isimlerini tamamı büyük olacak şekilde yazdırdım ve bunu my_dataupper ismiyle yeni bir veriseti olarak atadım.
head(mydata_upper)

dplyr::select(mydata,DataSource) # Datamızın içindeki DataSource değişkenini çektim. Birden fazla da seçip yazdırabilirdim.

dplyr::filter(mydata, Education == "High School") # Datamız içindeki eğitim düzeyi "high school" olanları filtreledim. Bunu birden fazla koşul ile yapabilirdim.

mydata %>% filter(Education == "High School" & Gender == "Male") %>% select(Response, DisplayOrder)  # Verisetimiz içinden eğitim düzeyi "high school" ve cinsiyeti "male" olanları filtreledim ve bunlara ait Response ve DisplayOrder değişkenlerini çağırdım.

mydata$newcolumn = mydata$DisplayOrder*5 # Datamız içine "newcolumn" adında yeni bir değişken sütunu ilave ettim. Bu yeni sütunun değerleri, DisplayOrder değişkeninin değerlerinin 5 ile çarpılması ile elde edildi.
head(mydata,3)

mydata = mutate(mydata, newcolumn2 = DisplayOrder+2) # Datamız içine "newcolumn2" adında yeni bir değişken sütunu ilave ettim. Bu yeni sütunun değerleri, DisplayOrder değişkeninin değerlerine +2 ilave edilmesi ile elde edildi.
head(mydata,3)

mydata = mutate(mydata,
                DisplayOrder_Yogunluk = ifelse(
                  DisplayOrder<=3,"Seyrek",
                  ifelse(DisplayOrder<=9,"Normal",
                         "Sıklıkla")
                ))                                      # ifelse kullanarak değerleri 3 koşula bağlı olarak değişen DisplayOrder_Yogunluk isimli yeni bir değişken atadım.
head(mydata$DisplayOrder_Yogunluk)      

mydata = mutate(mydata, 
                DisplayOrder_Yogunluk2 = case_when(
                  DisplayOrder<=3 ~ "Seyrek",
                  DisplayOrder>3 & DisplayOrder<=9 ~ "Normal",
                  DisplayOrder>9 ~ "Sıklıkla",
                ))
head(mydata$DisplayOrder_Yogunluk2)                     # case_when kullanarak koşulların sınırlarını daha detaylı çizmek suretiyle, yeni bir değişken olan DisplayOrder_Yogunluk2'yi atadım.




arrange(mydata, desc(mydata$DisplayOrder)) # DisplayOrder değişkeninin değerlerini büyükten küçüğe doğru sıralar. Bu değeri esas alarak tüm tabloyu listeler.

transmute(mydata,newcolumn3 = DisplayOrder*50, YEAR, LocationDesc )   # Yeni bir dataframe oluşturdum. Newcolumn3 adında yeni bir değişken oluşturdum. Bu değişkenin değerleri ilgili satırın DisplayOrder değerinin 50 ile çarpımıdır. Çıktı olarak yeni oluşturduğum Newcolumn3 değişkeninin yanı sıra YEAR ve LocationDesc değişkenlerini de listelemiş oldum. 





