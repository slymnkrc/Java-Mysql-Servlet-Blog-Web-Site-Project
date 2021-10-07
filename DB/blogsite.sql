-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2021 at 08:33 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogsite`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aid`, `username`, `email`, `password`) VALUES
(1, 'slymnkrc', 'slymnkrc@mail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'admin', 'admin@mail.com', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `cid` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `phone` text NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`cid`, `date`, `name`, `email`, `phone`, `message`) VALUES
(1, '2021-08-12', 'asdsad', 'aasdasdsa@asdsa.com', '45644', 'sadsadsa'),
(2, '2021-08-13', 'admin', 'admin@mail.com', '123456', 'admin mesajı');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `cid` int(11) NOT NULL,
  `category` text CHARACTER SET utf8 NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `detail` text CHARACTER SET utf8 NOT NULL,
  `date` datetime NOT NULL,
  `aid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`cid`, `category`, `title`, `detail`, `date`, `aid`) VALUES
(2, 'Dizi', 'Diziden Yeni Haberler', 'Yüzüklerin Efendisi dizisi, Amazon Prime Video için geliştirilen bir dizi. J. R. R. Tolkien\'in The Hobbit ve The Lord of the Rings kitaplarındaki olaylardan binlerce yıl öncesini anlatacak. Dizi, Orta Dünya\'nın İkinci Çağında geçmektedir.[2] Yapımcılığını Amazon Studio, Tolkien Estate, HarperCollins ve New Line Cinema üstlenirken dizi sorumlusu görevinde John D. Payne ve Patrick McKay bulunmaktadır.\r\n\r\nAmazon, Kasım 2017\'de Yüzüklerin Efendisi için televizyon hakkını 250 milyon dolara satın almak için Tolkien Estate ile bir anlaşma yaptı ve en az 1 milyar dolar değerinde beş sezonluk bir üretim taahhüdü verdi. Bu diziyi, bugüne kadarki en pahalı televizyon dizisi haline getirdi. Payne ve McKay Temmuz 2018\'de işe alındı ve yaratıcı ekibin kalan üyeleri bir yıl sonra açıklandı. Oyuncu seçimleri dünya çapında gerçekleştirildi. Çekimler Şubat 2020\'de Auckland, Yeni Zelanda\'da, orijinal film serisinin çekildiği mekanlarda başladı.\r\n\r\nYüzüklerin Efendisi\'nin 2021\'de Prime Video\'da yayınlanması bekleniyor.\r\n\r\nKonusu: \r\n\r\nOrta Dünya tarihinin destanlara konu olan İkinci Çağ’ındaki efsanevi kahramanları ilk kez ekrana getirecek. J.R.R. Tolkien’ın The Hobbit ve The Lord of the Rings’inin binlerce yıl öncesinde geçen bu epik drama, izleyicileri büyük güçlerin ortaya çıktığı, krallıkların yükseldiği ve çöktüğü, sürpriz kahramanların sınandığı, umudun pamuk ipliğine bağlı olduğu ve Tolkien’ın kaleminden çıkan en büyük kötü karakterin tüm dünyayı karanlığa gömmekle tehdit ettiği bir döneme götürecek. Orta Dünya’nın büyük ölçüde barış içinde olduğu bir dönemde başlayan dizi, hem tanıdık hem de yeni yüzlerden oluşan bir grup karakterin uzun süredir dönmesinden korkulan bir kötülüğün yeniden yükselmesiyle yüzleşmesini anlatacak. Dumanlı Dağlar’ın karanlık derinliklerinden, elflerin başkenti Lindon’ın görkemli ormanlarına, göz alıcı ada krallığı Númenor’dan haritanın en uç köşelerine, bu krallıklar ve karakterler, Orta Dünya’dan ayrıldıktan çok sonra da anlatılmaya devam edecek efsanelerini şekillendirecekler. ', '2021-08-13 03:28:56', 1),
(9, 'Film', 'Nostaljik İnceleme', 'Selamlar, sevgiler. Eski ve bende değerli olan filmleri “Nostaljik İnceleme” adı altında incelemeye devam ediyorum. Lord of the Rings, türkçe adıyla Yüzüklerin Efendisi’ni incelemek benim için zor olacak. Filmleri en sevdiğim seriler arasında. Gelip de burada “filmde şöyle oluyor, böyle oluyor” demekten çok yorum belirtmek istiyorum. Tabi bazı yorumlarımı belirtirken, olaylardan bahsetmem gerekebilir. Kitaplarını okumuş olsam bile, bunu incelememe karıştırmayacağım. Çünkü bu filmlerinin incelemesi. Film incelemesini, film olarak değerlendirmek lazım ama saygımızdan Tolkien’den tabi ki bahsedeceğim. Eğer istek gelirse Orta Dünya kitaplarının incelemesini ayrı yapabilirim. Hepsini okumamış bile olsam, Silmarillion, Yüzüklerin Efendisi serisi, Hurin’in Çocukları okuduklarım arasında.\r\n\r\nBu film ve kitap serisi hakkında bir çok şey denildi. Denilmeye devam ediyor. Oldukça büyük bir evren olmasından mütevellit günümüzde bile yeni şeyler keşfedilebiliyor seri içerisinde. Ben burada Orta Dünya uzmanı olduğumu iddia etmiyorum. Film izleyen neredeyse herkes Yüzüklerin Efendisi izlemiştir. Çoğu kişi sevmiştir. Sevmeyen de oldukça büyük bir kesim var. Sevmeyenin neden sevmediği konusunda düşüncelerim var. Onları da belirteceğim. Burada yapmak istediğim şey, kendi düşüncelerimi dile getirmek olacaktır. Orta Dünya gizemlerini çözen yada senaryoyu anlatan bir sürü kişi oldu ve olmaya da devam edecek. Olması da gerekiyor. Bende bazen keşfetmekte zorluk yaşadığım bir sürü şey görüyorum. Bu aslında serinin ne kadar ayrıntılı ve kaliteli olduğunun göstergesi. Buna da değineceğim. İlk Tolkien’i analım.\r\n\r\nJohn Ronald Reuel Tolkien, bizim bildiğimiz üzerine Yüzüklerin Efendisi serisini de kapsayan Orta Dünya’nın kurucusudur. Kitaplarda bu dünyayı, aynı gerçek bir evren gibi en üst noktadan, en alt noktaya kadar kurgulamıştır. Bu kurgulamayı ise oldukça büyük düzen ve tutarlılık esasları altında yapıp, oldukça fazla ayrıntı ve kurgu yüklemiştir. Orta Dünya’da ki her detayı bilmek ve anlamak imkansız gibi bir şey. Kendi yaşadığınız dünyadaki her ayrıntıyı biliyor ve yorumlayabiliyor musunuz? Bunun cevabı yeterlidir. Tolkien’in hayatından bahsetmeyeceğim. Her yerde bulabilirsiniz zaten. Tolkien’in beni en çok şaşırtan özelliği, oldukça ileri düzeyde bir edebiyat dehası oluşu. Böyle insanlar az gelir. Böyle insanlar geldiğinde ise kıymeti yüzyıllarca sürer. Hala Yüzüklerin Efendisi hakkında konuşup, sorular sorup cevaplamaya çalışıyorsak ve en nihayetinde mantıklı bir detaya çıkıyorsa, bu Tolkien’in ispata ihtiyaç duymayan bir yazar olduğunun kanıtıdır. Buradan saygıyla anıyoruz. Şimdi ise kitaplardan ve Tolkien’den uzaklaşıp, filmlere ufaktan geçelim.\r\n\r\nYüzüklerin Efendisi’nin bilindiği üzere 3 adet filmi vardır. Yüzük Kardeşliği, İki Kule ve Kralın Dönüşü. Tek tek yorumlamaya geçmeden seri olarak değinmek istiyorum. Yüzüklerin Efendisi izlemesi de aslında zor bir seri. Ben bir kere normal cut izledim. Genellikle hep extended cut izledim. Öylede izlenmesini tavsiye ederim. Daha zor ve uzun hale geliyor evet ama extended cutta bulundurduğu sahnelerin çok değerli olduğunu düşünüyorum. Normalde filmlerdeki ek sahneler için öyle düşünmem. Çünkü aynı şeyin uzununu ortaya koyarlar. Yüzüklerin Efendisi’nde ki ek sahnelere bakıldığında, sanki extended değilmiş gibi çekilmiş ve kurgulanmış. Bu tür sahnelerin sayısı da çok fazla. Filmler Orta Dünya’yı anlamımıza olanak tanısa bile bunu tam anlamıyla başarması mümkün değil. Ama bu tanıma raddesine bizi bir adım daha fazla yakınlaştırıyor.', '2021-08-13 04:27:24', 1),
(10, 'Film', 'Film Üçlemesi (2001-2003)', 'Yüzüklerin Efendisi\'ni bir filme uyarlamak için Peter Jackson çok uzun süre uğraştı. Diğer filmlerin aksine uyarlama hakları, çekim için stüdyoyla anlaşmaya varmak gibi birçok sorun çıkmıştı. Sonunda Jackson, Miramax isimli stüdyo ile ikişer saatlik iki film için anlaşmaya vardılar. Daha sonra başta stüdyonun istekleri olmak üzere birçok problem ortaya çıktı. İşin sonunda New Line Cinema üç saatlik üç film için anlaşmaya vardı.\r\n\r\nPeter Jackson, sinema tarihinde bir ilki gerçekleştirerek her biri en az 3 saat uzunluğundaki bu 3 filmi art arda, hiç birini gösterime sokmadan çekti. Çekimlerden sonra gülerek \"Bunu yaptım ve hiç kimsenin neden yapmadığını artık biliyorum ve muhtemelen ben de yapmayacağım.\" diye belirtti. Tabi üç filmi art arda çekmeden önce yapılan hazırlık belki de çekim sırası kadar önemliydi. Yüzüklerin Efendisi\'nin daha çekimi başlamamıştı ancak ilk çekimden tam 3 yıl 6 ay önce hazırlıklar başlamıştı. Yeni Zelanda\'da Shire bölgesinin daha yeşil görünmesi için hayvanları 2 sene önceden otlatmışlardı bile. Yüzüklerin Efendisi Film Üçlemesi birçok rekora imza attı, sayısız başarılara sahip. Film daha çıkmadan \"Yeni Yıldız Savaşları\" deniyordu. İlk filmin fragmanı izlenme rekoru kırdı. Sonra birçok ülkede açılış rekoru kırdı. Birçok eleştirmenin oyuyla Dünya\'nın en iyi filmleri arasına girdi. Birçok film oylama sitesinde çok yüksek puanlar aldı. 2003\'te ikinci defa bir film 1 milyar dolar gişe yaptı ve 2009\'a kadar yani 6 sene boyunca 2. sırada durdu. İlk film 4, ikinci film 2, üçüncü film 11 Akademik Ödül aldı; böylece üçleme en çok Akademik Ödül kazanan film serisi oldu ve son film en çok Akademik Ödül kazanan film oldu. (11 Oscar alan iki başka film daha var.) Film IMDb\'de de film tarihinin en iyi film serisi oldu ve özellikle son film birçok kullanıcının en beğendiği film oldu. Fantastik filmler çoğunlukla olgun insanların pek beğenmediği filmler olarak görülmesine rağmen Dünya\'nın en iyi filmleri arasına girdi. IMDb\'de kullanıcı oylarıyla son film olan Kralın Dönüşü, en iyi filmler listesinde 7. sırada yer alıyor. Ayrıca fantastik filmleri çok seven eleştirmen Phekâr Shai\'nin yapmış olduğu Şimdiye Kadar Yapılmış En İyi Filmler (The Best Movies Ever Made) listesinin en başında Kralın Dönüşü yer alıyor. Yüzüklerin Efendisi Film Üçlemesi, Buz ve Ateşin Şarkısı\'nın yazarı George R. R. Martin\'in de favori filmlerinden birisi. Martin, Yüzüklerin Efendisi Film Üçlemesi için şöyle demişti: \"Jackson, Tolkien\'in yarattığı bu mükemmel Dünya\'yı en iyi şekilde filme yansıtıyor, Yüzüklerin Efendisi\'ni sevmeyen, fantastik filmleri sevmeyen birisidir.\"\r\n\r\nJackson teknik detaylara da çok takılmıştı. Filme başlamadan önce \"Artık ihtiyacımız olan teknolojiye sahibiz, Orta-Dünya sonunda bir filme aktarılabilir. Yani işte o zaman bu zaman.\" demişti. Jackson bu büyük filmi uyarlayabilmek için çok iyi efektlere ve yapı tasarımcılarına ihtiyacı olduğu için Weta Digital ve Weta Workshop isimli şirketler açtı. Weta Workshop makyaj, kostüm, yapı, set dekorasyonu, maket ve benzeri ürünler için açılmıştı. Weta Digital ise görsel efektleri yapacak olan şirketti. Sadece Minas-Tirith Kuşatması bölümünün efektleri ancak 3 aylık zorlu çalışmalarla bitirilebilmişti. Filmdeki Minas-Tirith, Ayrıkvadi gibi ortamlar aslında birer maketler, uzak çekim yapılırken maketi çekip sonra üzerine efektler yapılıyor çünkü o zamanlarda koskoca bir mekanı efektle baştan oluşturmak çok zor, Yüzüklerin Efendisi\'nde böyle mekanlardan sadece bir tane de yok. Kısacası tüm mekanları efektle yapmak hem zor hem de gerçekçiliği kaybettirecek bir şeydi. Bu başarılı efektler film serisinin üçüne de Yılın En İyi Görsel Efekt Akademi Ödülü\'nü kazandırdı. Fantastik bir evrende hem etkileyici aynı zamanda hem de gerçekçi görselleri birçok kişiye borçluyuz. Başta hayata gözlerini yuman görüntü yönetmeni Andrew Lesnie\'ye, efekt süpervisörü Jim Rygiel ve takımına, daha sonra yapı tasarımı işini yapanlara. Ayrıca başta desinatör John Howe olmak üzere Sanat Yönetimi\'ne borçluyuz. Elbette \r\n\r\n  ', '2021-08-13 09:29:32', 2),
(11, 'Kitap', 'Lotr Kitap J.R.R Tolkien', 'Yüzüklerin Efendisi (İng. The Lord of the Rings), İngiliz filolojist ve Oxford Üniversitesi profesörü J. R. R. Tolkien\'in yazdığı epik fantezi türündeki romandır. Hikâye, Tolkien\'in çocuklar için yazdığı 1937 tarihli Hobbit\'in devamı olarak başlamıştı ancak sonunda ondan çok daha büyük bir eser haline geldi. Çoğu II. Dünya Savaşı\'nda olmak üzere 1937 ve 1949 yılları arasında aşamalar halinde yazıldı. 150 milyonun üstündeki satış sayısıyla tüm zamanların en çok satan ikinci romanıdır.\r\n\r\nRomanın ismi bütün Orta Dünya\'yı fethedip hakimiyetine almakta kullandığı diğer Güç yüzükleri\'ne hükmeden Tek Yüzük\'ü ilk çağlarda yaratan, hikâyenin kötü karakterlerinden biri olan Lord Sauron\'u kasteder.[not 1] İngiliz kırsalından pek de farklı olmayan Hobbit diyarı Shire\'da sakince başlayan hikâye, Orta Dünya\'nın kuzeybatısına kadar uzanırken Hobbitler; Frodo, Sam, Merry ve Pippin\'in yanı sıra Hobbitlerin müttefikleri ve yol arkadaşları olan Kuzey Kolcusu Aragorn, Gondor kumandanı Boromir, savaşçı Cüce Gimli, Elf prensi Legolas ve büyücü Gandalf\'ın gözünden Yüzük Savaşı\'nın gidişatı takip edilir.\r\n\r\nEn başında Tolkien tarafından eserin Silmarillion ile birlikte iki ciltlik bir set oluşturması amaçlanıyordu ama yayıncı bu fikri reddetti. Ekonomik sebeplerden dolayı Yüzüklerin Efendisi 29 Temmuz 1954\'ten, 20 Ekim 1955\'e kadarki bir yıllık süreç içerisinde üç cilt olarak yayımlandı. Bu üç cilt Yüzük Kardeşliği, İki Kule ve Kralın Dönüşü olarak isimlendirildi. Roman yapı olarak üçüncü cildin sonunda dahil olduğu çeşitli bölümlerden, arka plan malzemeleriyle birlikte ikişer bölümden altı kitaba bölünmüş haldedir. Bazı baskılarda tüm roman tek bir cilt haline getirilmiştir. Yüzüklerin Efendisi defalarca yeniden basıldı ve birçok dile çevrildi.\r\n\r\nTolkien\'in eseri temaları ve kökenleri hakkında yapılan kapsamlı araştırmalara konu oldu. Kendi içerisinde büyük bir eser olsa da hikâye, aslında Tolkien\'in 1917\'den beri kendisinin \"mythopoeia\" olarak tanımladığı bir süreç içerisinde üstünde çalıştığı büyük bir destanın yalnızca son halkasıydı. Filolojinin, mitolojinin, dinin, sanayileşmenin etkilerinin yazarda yarattığı tiksinmenin yanı sıra daha önceki fantezi eserleri ve Tolkien\'in I. Dünya Savaşı\'ndaki deneyimleri yazarın ilk çalışmaları ve Yüzüklerin Efendisi\'nin hikâyesi üzerinde etkili oldu. Yüzüklerin Efendisi\'nin de modern fantezi edebiyatı üzerinde büyük etkisi olduğu kabul edilir. Tolkien\'in çalışmalarının etkisi öyle büyük oldu ki; \"Tolkienian\" ve \"Tolkienesque\" sözcükleri Oxford İngilizce Sözlüğü\'ne girdi.\r\n\r\nYüzüklerin Efendisi\'nin hep popüler kalması popüler kültürde göndermeler yapılmasına, Tolkien\'in çalışmalarına hayran olanların topluluklar kurmasına ve Tolkien ile eserleri hakkında birçok kitap yayımlanmasına sebep oldu. Yüzüklerin Efendisi geçmişte olduğu gibi hala sanat eserleri, müzik, film, televizyon, video oyunları ve edebiyatı etkilemeye devam ediyor. Yüzüklerin Efendisi için radyo, televizyon ve birçok filmin ödüllü olan uyarlamaları yapıldı.', '2021-08-13 09:16:52', 1),
(12, 'Oyun', 'Lotr Yeni Oyunu Duyuruldu', 'The Lord of The Rings, The Battle For Middle-Earth, EA Games tarafından PC Strateji oyunu olarak geliştirilmiş (RTS), Peter Jackson\'un, J.R.R. Tolkien\'in Yüzüklerin Efendisi üçlemesinden sinemaya uyarladığı filmi baz alınarak hazırlanmıştır. Oyun, filmden kesitlerin bulunduğu gerçekçi bir yapımdır. 6 Aralık 2004\'te; Ardından, The Lord of The Rings, The Battle For Middle Earth II, 2 Mart 2006 yılında piyasaya sürülmüştür.\r\n\r\nOyunun amacı, diğer strateji oyunlarında olduğu gibi, kaynaklar kazanıp (resource), bunlar ile bir askeri üs ve ardından ordu kurmak üzerinedir. Diğer oyunlardan farklı olarak Battle for Middle Earth\'te, binalar sadece belirli yerlere kurulabilmektedir. Bu \"slot\" adı verilen yerlerde tarlalardan, okçuluk okuluna kadar birçok seçenek vardır. Slotlardan oluşan kamplarınıza, haritanın farklı köşelerinde bulunan yerlerde yenilerini ekleyebilirsiniz. Bina ve asker çıkartmak için gerekli olan tek şey ise \"Resource\" adı verilen kaynaktır.\r\n\r\nBattle for Middle Earth iki taraf ve dört ırk barındırmaktadır.. Orta-Dünya\'nın özgür halklarından Rohanlılar ve Gondorlular iyilik tarafını oluştururken karanlık tarafı ise Mordor ve Isengard oluşturmaktadır. Her ırk kendine has strateji ve birimlere sahiptir; Rohan\'da Rohirrim, Mordor\'da Troll vb.\r\n\r\nBirimler, birkaç kategori altındadırlar. Atlılar, mızraklılar, okçular, kılıçlılar ve yaratıklar. Ayrıca bunların yanında oyunda \"hero\" yani kahraman adı verilen özel birimlerde mevcuttur. Kahramanlar, özel yeteneklere ve diğer birimlere karşı daha büyük vuruş gücü ve cana sahiptirler. Ancak her hero birim kategorilerine dahildir. Örneğin atlılar, mızraklılardan daha fazla darbe aldıkları için, atlı kahramanlar da mızraklardan daha fazla zarar görecektir. Ayrıca tüm birimler savaştıkça deneyim puanları kazanırlar ve seviye atlarlar.', '2021-08-13 09:17:53', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`cid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
