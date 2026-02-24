unit consts;

{$mode objfpc}{$H+}

interface


const
  MONTH_DAYS: array[1..12] of byte = (31,28,31,30,31,30,31,31,30,31,30,31);

  SECONDS_PER_MINUTE = 60;
  SECONDS_PER_HOUR = 3600;
  SECONDS_PER_DAY = 86400;

  DAYS_PER_WEEK = 7;
  MONTHS_PER_YEAR = 12;

  APPROX_DAYS_PER_MONTH = 30.4375;
  APPROX_DAYS_PER_YEAR = 365.25;

  ISC_TIME_SECONDS_PRECISION = 10000;

resourcestring
  SLongSun = 'Domingo';
  SLongMon = 'Segunda-Feira';
  SLongTue = 'Terça-Feira';
  SLongWed = 'Quarta-Feira';
  SLongThu = 'Quinta-Feira';
  SLongFri = 'Sexta-Feira';
  SLongSat = 'Sábado';

  SShortSun = 'Dom';
  SShortMon = 'Seg';
  SShortTue = 'Ter';
  SShortWed = 'Qua';
  SShortThu = 'Qui';
  SShortFri = 'Sex';
  SShortSat = 'Sáb';

  SLongJan = 'Janeiro';
  SLongFeb = 'Fevereiro';
  SLongMar = 'Março';
  SLongApr = 'Abril';
  SLongMay = 'Maio';
  SLongJun = 'Junho';
  SLongJul = 'Julho';
  SLongAug = 'Agosto';
  SLongSep = 'Setembro';
  SLongOct = 'Outubro';
  SLongNov = 'Novembro';
  SLongDec = 'Dezembro';

  SShortJan = 'Jan';
  SShortFeb = 'Fev';
  SShortMar = 'Mar';
  SShortApr = 'Abr';
  SShortMay = 'Mai';
  SShortJun = 'Jun';
  SShortJul = 'Jul';
  SShortAug = 'Ago';
  SShortSep = 'Set';
  SShortOct = 'Out';
  SShortNov = 'Nov';
  SShortDec = 'Dez';

implementation

end.

