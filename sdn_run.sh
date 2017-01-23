#!/bin/bash

# usage : run the shell script 



echo `date`": downloading sdn.xml from the internet"
wget -N  http://www.treasury.gov/ofac/downloads/sdn.xml

echo `date`": running perl parse on sdn.xml"
perl sdn_parse.pl sdn.xml

echo `date`": creating schema (if not exists)"
mysql < sdn.schema.sql

echo `date`": loading in entries"
mysql sdn < output.sql

echo `date`": done"
