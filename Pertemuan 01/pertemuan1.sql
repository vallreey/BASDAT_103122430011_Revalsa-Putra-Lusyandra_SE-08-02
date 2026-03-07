SQL> --nama: Revalsa Putra Lusyandra
SQL> --nim: 103122430011
SQL> --kelas: SE-08-02
SQL> desc kudabalap
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ID                                        NOT NULL CHAR(2)
 NAMA_KUDA                                          VARCHAR2(70)
 LAHIR                                              VARCHAR2(10)
 MENINGGAL                                          VARCHAR2(10)
 TOTAL_G1_RACE                                      NUMBER

SQL> SELECT c.constraint_name,
  2  c.constraint_type,
  3  cc.column_name,
  4  c.status
  5  FROM user_constraints c
  6  LEFT JOIN user_cons_columns cc
  7  ON c.constraint_name = cc.constraint_name
  8  WHERE c.table_name = 'KUDABALAP'
  9  ORDER BY c.constraint_name;

CONSTRAINT_NAME                                                                 
--------------------------------------------------------------------------------
C                                                                               
-                                                                               
COLUMN_NAME                                                                     
--------------------------------------------------------------------------------
STATUS                                                                          
--------                                                                        
P_KUDA                                                                          
P                                                                               
ID                                                                              
ENABLED                                                                                                                                                     

SQL> create table umamusume (
  2  id_uma char(3),
  3  uma VARCHAR2(80),
  4  track VARCHAR(10));

Table created.

SQL> insert into umamusume values ('001', 'FOREVER YOUNG', 'Medium');

1 row created.

SQL> select * from umamusume
  2  ;

ID_                                                                             
---                                                                             
UMA                                                                             
--------------------------------------------------------------------------------
TRACK                                                                           
----------                                                                      
001                                                                             
FOREVER YOUNG                                                                   
Medium                                                                          
                                                                                

SQL> spool off