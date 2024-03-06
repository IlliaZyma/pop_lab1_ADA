with Ada.Text_IO;
use Ada.Text_IO;
procedure Main is

   Can_Stop : Boolean := False;
   pragma Atomic(Can_Stop);
   task type Break_Task;
   task type Task1;
   Global_Task_ID : Integer := 0;
   time : Integer;


   task body Break_Task is
   begin
      delay Duration(time);
      Can_Stop := True;
   end Break_Task;

   task body Task1 is
      Sum1 : Long_Long_Integer := 0;
      Number1 : Long_Long_Integer := 0;
      Task1_ID : Integer := Global_Task_ID + 1;
   begin
      Global_Task_ID := Global_Task_ID + 1;
      loop
         Sum1 := Sum1 + Number1;
         Number1 := Number1 + 1;
         exit when Can_Stop;
      end loop;
      delay 1.0;

      Ada.Text_IO.Put_Line("# " & Task1_ID'Img & ": " & Sum1'Img);
   end Task1;

   begin
      time := Integer'Value(Get_Line);
   declare
      Breaker : Break_Task;
   T1 : Task1;
   T2 : Task1;
   T3 : Task1;
   begin
      null;
   end;


end Main;
