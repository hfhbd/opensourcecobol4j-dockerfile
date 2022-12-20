       IDENTIFICATION              DIVISION.
       PROGRAM-ID.                 SQL.
       DATA                        DIVISION.
       WORKING-STORAGE             SECTION.
       EXEC SQL INCLUDE SQLCA END-EXEC.
       PROCEDURE                   DIVISION.
           DISPLAY "HELLO WORLD!".
