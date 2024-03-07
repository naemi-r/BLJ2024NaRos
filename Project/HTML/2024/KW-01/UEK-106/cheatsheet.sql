--Einloggen in dem datenbankserver
--Benutzername = postgres
-- -h = host Name/ IP-Adresse 
psql -U postgres -h 192.168.18.128

--macht jetzt einen dump namens 
ssh sysadmin@192.168.18.128
cd /tmp
tar xvf schema-hr_postgresql_v1.0.4_uek106.tar.bz2
cd schema-hr
sudo -u postgres bash
cd /tmp/schema-hr
psql < hr_main.sql --nimm das main File
psql
SET search_path=hr;
\dt
\q
cd ..
rm -rf schema-xy
--wider ins grüne rein
mkdir db-backup 
sudo -u postgres pg_dump > ./db-backup/dump_all_`date +%Y%m%d`.sql
sudo -u postgres pg_dump --schema hr > ./db-backup/dump_hr_`date +%Y%m%d`.sql
sudo -u postgres pg_dump --schema employees | bzip2 -9 > ./db-backup/dump_employees_`date +%Y%m%d`.sql.bz2

--Schema wird gelöscht
sudo -u postgres psql
DROP SCHEMA hr CASCADE;
\dn
--Dann wird gelöschtes Schema wieder hergestellt
sudo -u postgres psql < ./db-backup/dump_hr_20220102.sql
bzip2 -d < ./db-backup/dump_hr_20220102.sql.bz2 | sudo -u postgres psql

--in Datenbank postgres wächseln
\c postgres;

--zum schauen wele Schemen in der Datenbank sind
\dn

--zum schauen welche tabellen in dem Schema zb. hr sind
\dt

--Zeitzone umstellen
$ sudo timedatectl set-timezone Europe/Zurich

--Zeitzone überprüfen
$ date

--prüfen, ob der Server auch eine mit NTP synchronisierte Zeit hat
$ timedatectl status

--File öffnen
sudo vi /etc/

--File bearbeiten (löschen, schreiben)
Ctrl E

--Das File schliessen und speichern
:wq (write quit)

--Prüfen, ob File aktiv ist
cat /etc/resolv.conf

--Firewall instalieren
sudo apt install ufw

--Port ssh (22) freischalten
sudo ufw allow ssh

--Firewall einschalten
sudo ufw enable

--Status der Firewall überprüfen
sudo ufw status

--Fingerprint des Servers anzeigen lassen
ssh-keygen -lf /etc/ssh/ssh_host_ed25519_key.pub

--Status des SQL-Servers abfragen
systemctl status sql

--Starten des SQL-Servers
sudo systemctl start sql

--Neustarten des SQL-Servers
sudo systemctl restart sql

--Stoppen des SQL-Servers
sudo systemctl stop sql

--Firewall rules löschen (mit zahl definieren welche reihe)
Sudo Ufo delete +zahl

asdfghjkl 
