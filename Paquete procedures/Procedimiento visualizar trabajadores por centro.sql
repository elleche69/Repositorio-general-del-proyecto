 
 CREATE OR replace 
  
 PROCEDURE procedimiento(
     idd IN Centrosbd.id%TYPE,
     c_cursor out sys_refcursor)
    is
 BEGIN  
    open c_cursor for select * from TRABAJADORESBD WHERE idcentro = idd;
    
 end procedimiento; 
  