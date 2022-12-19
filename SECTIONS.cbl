       IDENTIFICATION              DIVISION.
      ******************************************************************
       PROGRAM-ID.                 SECTIONS.
       AUTHOR. WEDEMANN / Softwork.app
       INSTALLATION. Softwork.app
       DATE-WRITTEN TODAY.
      ******************************************************************
       DATA                        DIVISION.
       WORKING-STORAGE SECTION.
       77 WORLD PIC X(6) VALUE 'WORLD!'.
       77 HELLO PIC X(6) VALUE 'HELLO'.
      /*****************************************************************
       PROCEDURE                   DIVISION.
      ******************************************************************
           DISPLAY HELLO WORLD
           PERFORM FOO.

       FOO SECTION.
      * Some Comment
           MOVE "42" TO WORLD
           DISPLAY "ANSWER"WORLD.
