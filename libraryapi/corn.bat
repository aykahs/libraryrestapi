@echo off
call  "D:\data\'personal project'\django\libraryrest\env\Scripts\activate"
python "D:\data\'personal project'\django\libraryrest\libraryapi\manage.py cronloop "
pause

