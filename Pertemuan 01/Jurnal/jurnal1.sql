SQL> --nim: 103122430011
SQL> --nama: Revalsa Putra Lusyandra
SQL> CREATE TABLE Film (
  2  id_film NUMBER PRIMARY KEY,
  3  judul VARCHAR2(255) NOT NULL,
  4  sinopsis CLOB,
  5  tahun NUMBER(4),
  6  durasi NUMBER(3)
  7  );
SQL> CREATE TABLE Theater (
  2  id_theater NUMBER PRIMARY KEY,
  3  harga NUMBER(10,2),
  4  kapasitas NUMBER(5),
  5  kelas VARCHAR2(50)
  6  );
SQL> CREATE TABLE Member (
  2  id_member NUMBER PRIMARY KEY,
  3  nama VARCHAR2(100) NOT NULL,
  4  no_hp VARCHAR2(15),
  5  tgl_lahir DATE,
  6  email VARCHAR2(100)
  7  );
SQL> CREATE TABLE Jadwal (
  2  id_jadwal NUMBER PRIMARY KEY,
  3  id_film NUMBER REFERENCES Film(id_film),
  4  id_theater NUMBER REFERENCES Theater(id_theater),
  5  periode_start DATE,
  6  periode_end DATE
  7  );
SQL> CREATE TABLE Inventaris (
  2  id_inventaris NUMBER PRIMARY KEY,
  3  id_theater NUMBER REFERENCES Theater(id_theater),
  4  nomor_kursi VARCHAR2(10)
  5  );
SQL> CREATE TABLE Transaksi (
  2  kode_pemesanan VARCHAR2(20) PRIMARY KEY,
  3  id_jadwal NUMBER,
  4  id_member NUMBER,
  5  status VARCHAR2(50),
  6  tanggal DATE,
  7  total_harga NUMBER(10, 2),
  8  CONSTRAINT fk_jadwal_trx FOREIGN KEY (id_jadwal)
  9  REFERENCES Jadwal(id_jadwal),
 10  CONSTRAINT fk_member_trx FOREIGN KEY (id_member)
 11  REFERENCES Member(id_member)
 12  );
SQL> desc film
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 ID_FILM                                                                                                           NOT NULL NUMBER
 JUDUL                                                                                                             NOT NULL VARCHAR2(255)
 SINOPSIS                                                                                                                   CLOB
 TAHUN                                                                                                                      NUMBER(4)
 DURASI                                                                                                                     NUMBER(3)

SQL> desc theater
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 ID_THEATER                                                                                                        NOT NULL NUMBER
 HARGA                                                                                                                      NUMBER(10,2)
 KAPASITAS                                                                                                                  NUMBER(5)
 KELAS                                                                                                                      VARCHAR2(50)

SQL> desc member
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 ID_MEMBER                                                                                                         NOT NULL NUMBER
 NAMA                                                                                                              NOT NULL VARCHAR2(100)
 NO_HP                                                                                                                      VARCHAR2(15)
 TGL_LAHIR                                                                                                                  DATE
 EMAIL                                                                                                                      VARCHAR2(100)

SQL> desc jadwal
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 ID_JADWAL                                                                                                         NOT NULL NUMBER
 ID_FILM                                                                                                                    NUMBER
 ID_THEATER                                                                                                                 NUMBER
 PERIODE_START                                                                                                              DATE
 PERIODE_END                                                                                                                DATE

SQL> desc inventaris
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 ID_INVENTARIS                                                                                                     NOT NULL NUMBER
 ID_THEATER                                                                                                                 NUMBER
 NOMOR_KURSI                                                                                                                VARCHAR2(10)

SQL> desc transaksi
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 KODE_PEMESANAN                                                                                                    NOT NULL VARCHAR2(20)
 ID_JADWAL                                                                                                                  NUMBER
 ID_MEMBER                                                                                                                  NUMBER
 STATUS                                                                                                                     VARCHAR2(50)
 TANGGAL                                                                                                                    DATE
 TOTAL_HARGA                                                                                                                NUMBER(10,2)

SQL> SET LINESIZE 200;
SQL> SET PAGESIZE 100;
SQL> SET FEEDBACK OFF;
SQL> COLUMN judul FORMAT A25;
SQL> COLUMN sinopsis FORMAT A30;
SQL> COLUMN nama FORMAT A15;
SQL> COLUMN email FORMAT A20;
SQL> COLUMN kelas FORMAT A15;
SQL> COLUMN status FORMAT A10;
SQL> COLUMN kode_pemesanan FORMAT A10;
SQL> COLUMN nomor_kursi FORMAT A5;
SQL> INSERT ALL
  2  INTO Film VALUES (1, 'Initial D Final Stage', 'Balapan terakhir Takumi.', 2014, 120)
  3  INTO Film VALUES (2, 'Gundam Hathaway', 'Pemberontakan Mafty.', 2021, 95)
  4  INTO Film VALUES (3, 'Uma Musume Shin Jidai Tobira', 'Perjuangan Jungle Pocket.', 2024, 108)
  5  INTO Film VALUES (4, 'Shin Kamen Rider', 'Takeshi Hongo vs SHOCKER.', 2023, 121)
  6  INTO Film VALUES (5, 'Shin Ultraman', 'Raksasa perak pelindung Bumi.', 2022, 113)
  7  INTO Film VALUES (6, 'Evangelion Rebuild', 'Konklusi akhir Shinji Ikari.', 2021, 155)
  8  SELECT * FROM dual;
SQL> INSERT ALL
  2  INTO Theater VALUES (1, 50000, 50, 'theater 1')
  3  INTO Theater VALUES (2, 50000, 50, 'theater 2')
  4  INTO Theater VALUES (3, 75000, 30, 'premium 1')
  5  INTO Theater VALUES (4, 75000, 30, 'premium 2')
  6  INTO Theater VALUES (5, 100000, 20, 'paket sultan 2D')
  7  INTO Theater VALUES (6, 150000, 15, 'paket sultan 3D')
  8  SELECT * FROM dual;
SQL> INSERT ALL
  2  INTO Member VALUES (1, 'Revalsa Putra L', '085640075728', TO_DATE('2006-05-06','YYYY-MM-DD'), 'vallreey@mail.com')
  3  INTO Member VALUES (2, 'Kita Ikuyo', '085645565728', TO_DATE('2006-05-12','YYYY-MM-DD'), 'kitachan@mail.com')
  4  INTO Member VALUES (3, 'Takumi', '085647543228', TO_DATE('2000-01-15','YYYY-MM-DD'), 'fujiwara@mail.com')
  5  INTO Member VALUES (4, 'Bahlil', '085650615728', TO_DATE('1980-08-30','YYYY-MM-DD'), 'etanol@mail.com')
  6  INTO Member VALUES (5, 'Wowok', '085676975728', TO_DATE('1997-03-10','YYYY-MM-DD'), 'wowokcoy@mail.com')
  7  INTO Member VALUES (6, 'Narita Brian', '085649995728', TO_DATE('1994-12-25','YYYY-MM-DD'), 'brian@mail.com')
  8  SELECT * FROM dual;
SQL> INSERT ALL
  2  INTO Jadwal VALUES (1, 1, 1, TO_DATE('2026-03-12 13:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-03-12 15:00', 'YYYY-MM-DD HH24:MI'))
  3  INTO Jadwal VALUES (2, 2, 3, TO_DATE('2026-03-12 14:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-03-12 15:35', 'YYYY-MM-DD HH24:MI'))
  4  INTO Jadwal VALUES (3, 3, 5, TO_DATE('2026-03-12 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-03-12 17:48', 'YYYY-MM-DD HH24:MI'))
  5  INTO Jadwal VALUES (4, 4, 2, TO_DATE('2026-03-13 13:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-03-13 15:01', 'YYYY-MM-DD HH24:MI'))
  6  INTO Jadwal VALUES (5, 5, 4, TO_DATE('2026-03-13 19:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-03-13 20:53', 'YYYY-MM-DD HH24:MI'))
  7  INTO Jadwal VALUES (6, 6, 6, TO_DATE('2026-03-13 20:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2026-03-13 22:35', 'YYYY-MM-DD HH24:MI'))
  8  SELECT * FROM dual;
SQL> INSERT ALL
  2  INTO Inventaris VALUES (1, 1, 'A1')
  3  INTO Inventaris VALUES (2, 2, 'A5')
  4  INTO Inventaris VALUES (3, 3, 'B2')
  5  INTO Inventaris VALUES (4, 4, 'C10')
  6  INTO Inventaris VALUES (5, 5, 'D3')
  7  INTO Inventaris VALUES (6, 6, 'E1')
  8  SELECT * FROM dual;
SQL> INSERT ALL
  2  INTO Transaksi VALUES (101, 1, 1, 'LUNAS', SYSDATE, 50000)
  3  INTO Transaksi VALUES (102, 2, 2, 'LUNAS', SYSDATE, 75000)
  4  INTO Transaksi VALUES (103, 3, 3, 'LUNAS', SYSDATE, 100000)
  5  INTO Transaksi VALUES (104, 4, 4, 'PENDING', SYSDATE, 50000)
  6  INTO Transaksi VALUES (105, 5, 5, 'LUNAS', SYSDATE, 75000)
  7  INTO Transaksi VALUES (106, 6, 6, 'LUNAS', SYSDATE, 150000)
  8  SELECT * FROM dual;
SQL> SELECT * FROM film;

   ID_FILM JUDUL                     SINOPSIS                            TAHUN     DURASI                                                                                                               
---------- ------------------------- ------------------------------ ---------- ----------                                                                                                               
         1 Initial D Final Stage     Balapan terakhir Takumi.             2014        120                                                                                                               
         2 Gundam Hathaway           Pemberontakan Mafty.                 2021         95                                                                                                               
         3 Uma Musume Shin Jidai Tob Perjuangan Jungle Pocket.            2024        108                                                                                                               
           ira                                                                                                                                                                                          
                                                                                                                                                                                                        
         4 Shin Kamen Rider          Takeshi Hongo vs SHOCKER.            2023        121                                                                                                               
         5 Shin Ultraman             Raksasa perak pelindung Bumi.        2022        113                                                                                                               
         6 Evangelion Rebuild        Konklusi akhir Shinji Ikari.         2021        155                                                                                                               
SQL> select * from theater;

ID_THEATER      HARGA  KAPASITAS KELAS                                                                                                                                                                  
---------- ---------- ---------- ---------------                                                                                                                                                        
         1      50000         50 theater 1                                                                                                                                                              
         2      50000         50 theater 2                                                                                                                                                              
         3      75000         30 premium 1                                                                                                                                                              
         4      75000         30 premium 2                                                                                                                                                              
         5     100000         20 paket sultan 2D                                                                                                                                                        
         6     150000         15 paket sultan 3D                                                                                                                                                        
SQL> select * from member;

 ID_MEMBER NAMA            NO_HP           TGL_LAHIR EMAIL                                                                                                                                              
---------- --------------- --------------- --------- --------------------                                                                                                                               
         1 Revalsa Putra L 085640075728    06-MAY-06 vallreey@mail.com                                                                                                                                  
         2 Kita Ikuyo      085645565728    12-MAY-06 kitachan@mail.com                                                                                                                                  
         3 Takumi          085647543228    15-JAN-00 fujiwara@mail.com                                                                                                                                  
         4 Bahlil          085650615728    30-AUG-80 etanol@mail.com                                                                                                                                    
         5 Wowok           085676975728    10-MAR-97 wowokcoy@mail.com                                                                                                                                  
         6 Narita Brian    085649995728    25-DEC-94 brian@mail.com                                                                                                                                     
SQL> select * from jadwal;

 ID_JADWAL    ID_FILM ID_THEATER PERIODE_S PERIODE_E                                                                                                                                                    
---------- ---------- ---------- --------- ---------                                                                                                                                                    
         1          1          1 12-MAR-26 12-MAR-26                                                                                                                                                    
         2          2          3 12-MAR-26 12-MAR-26                                                                                                                                                    
         3          3          5 12-MAR-26 12-MAR-26                                                                                                                                                    
         4          4          2 13-MAR-26 13-MAR-26                                                                                                                                                    
         5          5          4 13-MAR-26 13-MAR-26                                                                                                                                                    
         6          6          6 13-MAR-26 13-MAR-26                                                                                                                                                    
SQL> select * from inventaris;

ID_INVENTARIS ID_THEATER NOMOR                                                                                                                                                                          
------------- ---------- -----                                                                                                                                                                          
            1          1 A1                                                                                                                                                                             
            2          2 A5                                                                                                                                                                             
            3          3 B2                                                                                                                                                                             
            4          4 C10                                                                                                                                                                            
            5          5 D3                                                                                                                                                                             
            6          6 E1                                                                                                                                                                             
SQL> select * from transaksi;

KODE_PEMES  ID_JADWAL  ID_MEMBER STATUS     TANGGAL    TOTAL_HARGA                                                                                                                                      
---------- ---------- ---------- ---------- --------- ------------                                                                                                                                      
101                 1          1 LUNAS      11-MAR-26       50,000                                                                                                                                      
102                 2          2 LUNAS      11-MAR-26       75,000                                                                                                                                      
103                 3          3 LUNAS      11-MAR-26      100,000                                                                                                                                      
104                 4          4 PENDING    11-MAR-26       50,000                                                                                                                                      
105                 5          5 LUNAS      11-MAR-26       75,000                                                                                                                                      
106                 6          6 LUNAS      11-MAR-26      150,000                                                                                                                                      
SQL> UPDATE Theater
  2  SET harga = 60000
  3  WHERE id_theater = 1;
SQL> UPDATE Transaksi
  2  SET status = 'LUNAS'
  3  WHERE kode_pemesanan = 104;
SQL> UPDATE Film
  2  SET sinopsis = 'Intinya Gundam XI dah gitu aja :v'
  3  WHERE id_film = 2;
SQL> UPDATE Theater
  2  SET kapasitas = 25
  3  WHERE id_theater = 5;
SQL> UPDATE Member
  2  SET no_hp = '08998877665'
  3  WHERE id_member = 3;
SQL> SELECT id_theater, harga FROM Theater WHERE id_theater = 1;

ID_THEATER      HARGA                                                                                                                                                                                   
---------- ----------                                                                                                                                                                                   
         1      60000                                                                                                                                                                                   
SQL> SELECT kode_pemesanan, status, total_harga FROM Transaksi WHERE kode_pemesanan = 104;

KODE_PEMES STATUS      TOTAL_HARGA                                                                                                                                                                      
---------- ---------- ------------                                                                                                                                                                      
104        LUNAS            50,000                                                                                                                                                                      
SQL> SELECT id_film, judul, sinopsis FROM Film WHERE id_film = 2;

   ID_FILM JUDUL                     SINOPSIS                                                                                                                                                           
---------- ------------------------- ------------------------------                                                                                                                                     
         2 Gundam Hathaway           Intinya Gundam XI dah gitu aja                                                                                                                                     
                                      :v                                                                                                                                                                
                                                                                                                                                                                                        
SQL> SELECT id_member, nama, no_hp FROM Member WHERE id_member = 3;

 ID_MEMBER NAMA            NO_HP                                                                                                                                                                        
---------- --------------- ---------------                                                                                                                                                              
         3 Takumi          08998877665                                                                                                                                                                  
SQL> SELECT id_theater, kelas, kapasitas, harga FROM Theater WHERE id_theater = 5;

ID_THEATER KELAS            KAPASITAS      HARGA                                                                                                                                                        
---------- --------------- ---------- ----------                                                                                                                                                        
         5 paket sultan 2D         25     100000                                                                                                                                                        
SQL> DELETE FROM Transaksi
  2  WHERE kode_pemesanan = 106;
SQL> DELETE FROM Inventaris
  2  WHERE id_inventaris = 6;
SQL> select * from transaksi;

KODE_PEMES  ID_JADWAL  ID_MEMBER STATUS     TANGGAL    TOTAL_HARGA                                                                                                                                      
---------- ---------- ---------- ---------- --------- ------------                                                                                                                                      
101                 1          1 LUNAS      11-MAR-26       50,000                                                                                                                                      
102                 2          2 LUNAS      11-MAR-26       75,000                                                                                                                                      
103                 3          3 LUNAS      11-MAR-26      100,000                                                                                                                                      
104                 4          4 LUNAS      11-MAR-26       50,000                                                                                                                                      
105                 5          5 LUNAS      11-MAR-26       75,000                                                                                                                                      
SQL> select * from inventaris;

ID_INVENTARIS ID_THEATER NOMOR                                                                                                                                                                          
------------- ---------- -----                                                                                                                                                                          
            1          1 A1                                                                                                                                                                             
            2          2 A5                                                                                                                                                                             
            3          3 B2                                                                                                                                                                             
            4          4 C10                                                                                                                                                                            
            5          5 D3                                                                                                                                                                             
SQL> SPOOL OFF
