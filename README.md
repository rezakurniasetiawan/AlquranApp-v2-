# Al-Qur'an App

Development By :<br>
Nama : Reza Kurnia Setiawan <br>
NIM : 19051397021 <br>
Prodi : Manajemen Informatika 2019A <br>

# Fitur Al-Quran App
1. Al-quran Lengkap beserta terjemahan bahasa indonesia <br>
2. 99 Asmaul Husna<br>
3. Doa Sehari-hari<br>
4. Jadwal Sholat Realtime => Update<br>
5. Comunnty <br>

## Data Al-Quran menggunakan API & Local Json
# List Surat
Firebase: https://al-quran-8d642.firebaseio.com/data.json?print=pretty<br>
```
[ 
	{
	  "arti" : "Pembukaan",
	  "asma" : "الفاتحة",
	  "audio" : "http://ia802609.us.archive.org/13/items/quraninindonesia/001AlFaatihah.mp3",
	  "ayat" : 7,
	  "keterangan" : "Surat <i>Al Faatihah</i> (Pembukaan) yang diturunkan di Mekah dan terdiri dari 7 ayat adalah surat yang ...",
	  "nama" : "Al Fatihah",
	  "nomor" : "1",
	  "rukuk" : "1",
	  "type" : "mekah",
	  "urut" : "5"
	}, 
	{
	  "arti" : "Sapi Betina",
	  "asma" : "البقرة",
	  "audio" : "http://ia802609.us.archive.org/13/items/quraninindonesia/002AlBaqarah.mp3",
	  "ayat" : 286,
	  "keterangan" : "Surat <i>Al Baqarah</i> yang 286 ayat itu turun di Madinah yang sebahagian besar diturunkan pada permulaan ...",
	  "nama" : "Al Baqarah",
	  "nomor" : "2",
	  "rukuk" : "40",
	  "type" : "madinah",
	  "urut" : "87"
	},
	...
]
```

# List Ayat
Npoint: https://api.npoint.io/99c279bb173a6e28359c/surat/1
```
[ 
	{
	  "ar" : "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
	  "id" : "Dengan menyebut nama Allah Yang Maha Pemurah lagi Maha Penyayang.",
	  "nomor" : "1",
	  "tr" : "bismi <strong>al</strong>l<u>aa</u>hi <strong>al</strong>rra<u>h</u>m<u>aa</u>ni <strong>al</strong>rra<u>h</u>iim<strong>i</strong>"
	}, 
	{
	  "ar" : "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ",
	  "id" : "Segala puji bagi Allah, Tuhan semesta alam.",
	  "nomor" : "2",
	  "tr" : "al<u>h</u>amdu lill<u>aa</u>hi rabbi <strong>a</strong>l'<u>aa</u>lamiin<strong>a</strong>"
	}, 
	...
]
```
# Jadwal Sholat
API https://api.pray.zone/v2/times/today.json?city=${location}&school=9

${location} = ganti dengan kota/lokasi

## Screenshot Al-Quran App
<img src="https://user-images.githubusercontent.com/56224328/146639832-fcb2b2d2-a49c-43f2-853e-af71ff13d0fd.jpg" alt="1" width="250"/>
<img src="https://user-images.githubusercontent.com/56224328/146639854-1c3e169b-0df3-488c-b374-e9e841aa0ed0.jpg" alt="1" width="250"/>
<img src="https://user-images.githubusercontent.com/56224328/146639856-ddc40db1-2b6d-4887-8bf9-93401a0c2394.jpg" alt="1" width="250"/>
<img src="https://user-images.githubusercontent.com/56224328/146639874-bf39599b-0555-455d-a92f-eae62591e2d0.jpg" alt="1" width="250"/>
<img src="https://user-images.githubusercontent.com/56224328/146639878-bca9af6a-bb30-4a31-86f6-16c06eba7907.jpg" alt="1" width="250"/>
<img src="https://user-images.githubusercontent.com/56224328/146639881-99a72be2-db16-4032-946b-9e6054670f58.jpg" alt="1" width="250"/>
<img src="https://user-images.githubusercontent.com/56224328/146639887-80adc758-0223-43e6-adfc-53120a118f15.jpg" alt="1" width="250"/>
<img src="https://user-images.githubusercontent.com/56224328/146639889-45ad7943-e6ab-4fe4-bf89-323cf1570ee9.jpg" alt="1" width="250"/>
<img src="https://user-images.githubusercontent.com/56224328/146639896-2c38fd77-32a3-401a-b607-ebba37aff39d.jpg" alt="1" width="250"/>
<img src="https://user-images.githubusercontent.com/56224328/146640103-d67509c1-b08d-41b8-b2f2-5ad1857706a6.jpg" alt="1" width="250"/>
