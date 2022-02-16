import 'package:fifa/classes/league.dart';

class FIFAImages{

  String campeonatoInternacionalLogo(String campeonatoFoto){
    String imageLogo = '';
    if(campeonatoFoto=="Champions"){       imageLogo = 'championsleague';       }
    if(campeonatoFoto=="Libertadores"){       imageLogo = 'libertadores';       }
    return imageLogo;
  }

  String imageLogo(String timeFoto){
    String imageLogo = '';
    if(timeFoto=="Atlético-MG"){       imageLogo='atleticomg';        }
    if(timeFoto=="Atlético-PR"){       imageLogo='atleticopr';        }
    if(timeFoto=="Bahia"){             imageLogo='bahia';         }
    if(timeFoto=="Botafogo"){          imageLogo='botafogo';         }
    if(timeFoto=="Corinthians"){       imageLogo='corinthians';        }
    if(timeFoto=="Cruzeiro"){          imageLogo='cruzeiro';         }
    if(timeFoto=="Flamengo"){          imageLogo='flamengo';        }
    if(timeFoto=="Fluminense"){        imageLogo='fluminense';        }
    if(timeFoto=="Grêmio"){            imageLogo='gremio';        }
    if(timeFoto=="Goiás"){            imageLogo='goias';        }
    if(timeFoto=="Internacional"){     imageLogo='internacional';        }
    if(timeFoto=="Palmeiras"){            imageLogo='palmeiras';   }
    if(timeFoto=="Santos"){            imageLogo='santos';        }
    if(timeFoto=="São Paulo"){         imageLogo='saopaulo';        }
    if(timeFoto=="Sport"){            imageLogo='sport';        }
    if(timeFoto=="Vasco"){            imageLogo='vasco';        }

    if(timeFoto=="Arsenal"){            imageLogo='arsenal';        }
    if(timeFoto=="Aston Villa"){            imageLogo='astonvilla';        }
    if(timeFoto=="Crystal Palace"){            imageLogo='crystalpalace';        }
    if(timeFoto=="Chelsea"){            imageLogo='chelsea';        }
    if(timeFoto=="Everton"){            imageLogo='everton';        }
    if(timeFoto=="Leicester"){            imageLogo='leicester';        }
    if(timeFoto=="Leeds United"){            imageLogo='leeds';        }
    if(timeFoto=="Liverpool"){            imageLogo='liverpool';        }
    if(timeFoto=="Manchester City"){            imageLogo='manchestercity';        }
    if(timeFoto=="Manchester United"){            imageLogo='manchesterunited';        }
    if(timeFoto=="Newcastle"){            imageLogo='newcastle';        }
    if(timeFoto=="Southampton"){            imageLogo='southampton';        }
    if(timeFoto=="Tottenham"){            imageLogo='tottenham';        }
    if(timeFoto=="West Bromwich"){            imageLogo='westbromwich';        }
    if(timeFoto=="West Ham"){            imageLogo='westham';        }
    if(timeFoto=="Wolves"){            imageLogo='wolves';        }

    if(timeFoto=="Atalanta"){            imageLogo='atalanta';        }
    if(timeFoto=="Bologna"){            imageLogo='bologna';        }
    if(timeFoto=="Cagliari"){            imageLogo='cagliari';        }
    if(timeFoto=="Fiorentina"){            imageLogo='fiorentina';        }
    if(timeFoto=="Genoa"){            imageLogo='genoa';        }
    if(timeFoto=="Inter"){            imageLogo='inter';        }
    if(timeFoto=="Juventus"){            imageLogo='juventus';        }
    if(timeFoto=="Milan"){            imageLogo='milan';        }
    if(timeFoto=="Lazio"){            imageLogo='lazio';        }
    if(timeFoto=="Napoli"){            imageLogo='napoli';        }
    if(timeFoto=="Parma"){            imageLogo='parma';        }
    if(timeFoto=="Roma"){            imageLogo='roma';        }
    if(timeFoto=="Sampdoria"){            imageLogo='sampdoria';        }
    if(timeFoto=="Sassuolo"){            imageLogo='sassuolo';        }
    if(timeFoto=="Torino"){            imageLogo='torino';        }
    if(timeFoto=="Udinese"){            imageLogo='udinese';        }

    if(timeFoto=="Athletic Bilbao"){            imageLogo='athleticbilbao';        }
    if(timeFoto=="Atlético Madrid"){            imageLogo='atleticomadrid';        }
    if(timeFoto=="Barcelona"){            imageLogo='barcelona';        }
    if(timeFoto=="Celta de Vigo"){            imageLogo='celta';        }
    if(timeFoto=="Espanyol"){            imageLogo='espanyol';        }
    if(timeFoto=="Getafe"){            imageLogo='getafe';        }
    if(timeFoto=="Osasuna"){            imageLogo='osasuna';        }
    if(timeFoto=="La Coruna"){            imageLogo='lacoruna';        }
    if(timeFoto=="Levante"){            imageLogo='levante';        }
    if(timeFoto=="Real Betis"){            imageLogo='realbetis';        }
    if(timeFoto=="Real Madrid"){            imageLogo='realmadrid';        }
    if(timeFoto=="Real Sociedad"){            imageLogo='realsociedad';        }
    if(timeFoto=="Sevilla"){            imageLogo='sevilla';        }
    if(timeFoto=="Valladolid"){            imageLogo='valladolid';        }
    if(timeFoto=="Valencia"){            imageLogo='valencia';        }
    if(timeFoto=="Villareal"){            imageLogo='villareal';        }

    if(timeFoto=="Moenchengladbach"){            imageLogo='borussia';        }
    if(timeFoto=="Borussia Dortmund"){            imageLogo='dortmund';        }
    if(timeFoto=="Bayern Munique"){            imageLogo='bayern';        }
    if(timeFoto=="Bayer Leverkusen"){            imageLogo='leverkusen';        }
    if(timeFoto=="Eintracht Frankfurt"){            imageLogo='frankfurt';        }
    if(timeFoto=="Augsburg"){            imageLogo='augsburg';        }
    if(timeFoto=="Freiburg"){            imageLogo='freiburg';        }
    if(timeFoto=="Hamburgo"){            imageLogo='hamburgo';        }
    if(timeFoto=="Colonia"){            imageLogo='colonia';        }
    if(timeFoto=="Hannover96"){            imageLogo='hannover96';        }
    if(timeFoto=="Hertha Berlim"){            imageLogo='hertha';        }
    if(timeFoto=="Hoffenheim"){            imageLogo='hoffenheim';        }
    if(timeFoto=="RB Leipzig"){            imageLogo='leipzig';        }
    if(timeFoto=="Schalke-04"){            imageLogo='schalke';        }
    if(timeFoto=="Stuttgart"){            imageLogo='stuttgart';        }
    if(timeFoto=="Werder Bremen"){            imageLogo='werderbremen';        }
    if(timeFoto=="Wolfsburg"){            imageLogo='wolfsburg';        }

    if(timeFoto=="Bordeaux"){            imageLogo='bordeaux';        }
    if(timeFoto=="Lille"){            imageLogo='lille';        }
    if(timeFoto=="Lyon"){            imageLogo='lyon';        }
    if(timeFoto=="Monaco"){            imageLogo='monaco';        }
    if(timeFoto=="Montpellier"){            imageLogo='montpellier';        }
    if(timeFoto=="Nantes"){            imageLogo='nantes';        }
    if(timeFoto=="Nice"){            imageLogo='nice';        }
    if(timeFoto=="Olympique Marselha"){            imageLogo='marseille';        }
    if(timeFoto=="PSG"){            imageLogo='psg';        }
    if(timeFoto=="Reims"){            imageLogo='reims';        }
    if(timeFoto=="Rennes"){            imageLogo='rennes';        }
    if(timeFoto=="Saint-Etienne"){            imageLogo='stetienne';        }
    if(timeFoto=="Metz"){            imageLogo='metz';        }
    if(timeFoto=="Anderlecht"){            imageLogo='anderlecht';        }
    if(timeFoto=="Brugge"){            imageLogo='brugge';        }
    if(timeFoto=="Standard Liege"){            imageLogo='liege';        }

    if(timeFoto=="Benfica"){            imageLogo='benfica';        }
    if(timeFoto=="Porto"){            imageLogo='porto';        }
    if(timeFoto=="Sporting"){            imageLogo='sporting';        }
    if(timeFoto=="Braga"){            imageLogo='braga';        }
    if(timeFoto=="Vitória Guimarães"){            imageLogo='guimaraes';        }
    if(timeFoto=="Ajax"){            imageLogo='ajax';        }
    if(timeFoto=="Feyenoord"){            imageLogo='feyenoord';        }
    if(timeFoto=="PSV"){            imageLogo='psv';        }
    if(timeFoto=="Celtic"){            imageLogo='celtic';        }
    if(timeFoto=="Glasgow Rangers"){            imageLogo='rangers';        }
    if(timeFoto=="Rosemborg"){            imageLogo='rosemborg';        }
    if(timeFoto=="Malmo"){            imageLogo='malmo';        }
    if(timeFoto=="Copenhague"){            imageLogo='copenhague';        }
    if(timeFoto=="RB Salzburg"){            imageLogo='rbsalzburg';        }
    if(timeFoto=="Rapid Viena"){            imageLogo='rapidviena';        }
    if(timeFoto=="Basel"){            imageLogo='basel';        }

    if(timeFoto=="Zenit"){            imageLogo='zenit';        }
    if(timeFoto=="CSKA"){            imageLogo='cska';        }
    if(timeFoto=="Krasnodar"){            imageLogo='krasnodar';        }
    if(timeFoto=="Spartak Moscou"){            imageLogo='spartak';        }
    if(timeFoto=="Galatasaray"){            imageLogo='galatasaray';        }
    if(timeFoto=="Fenerbahce"){            imageLogo='fenerbahce';        }
    if(timeFoto=="Besiktas"){            imageLogo='besiktas';        }
    if(timeFoto=="Olympiakos"){            imageLogo='olympiakos';        }
    if(timeFoto=="Estrela Vermelha"){            imageLogo='estrelavermelha';        }
    if(timeFoto=="Partizan"){            imageLogo='partizan';        }
    if(timeFoto=="Ludogorets"){            imageLogo='ludogorets';        }
    if(timeFoto=="Dinamo Zagreb"){            imageLogo='dinamozagreb';        }
    if(timeFoto=="Shaktar Donetsk"){            imageLogo='shaktar';        }
    if(timeFoto=="Dinamo Kiev"){            imageLogo='dinamokiev';        }
    if(timeFoto=="Sparta Praga"){            imageLogo='spartapraga';        }
    if(timeFoto=="APOEL"){            imageLogo='apoel';        }

    if(timeFoto=="Birmigham"){            imageLogo='birmigham';        }
    if(timeFoto=="Blackburn"){            imageLogo='blackburn';        }
    if(timeFoto=="Bournemouth"){            imageLogo='bournemouth';        }
    if(timeFoto=="Burnley"){            imageLogo='burnley';        }
    if(timeFoto=="Brighton"){            imageLogo='brighton';        }
    if(timeFoto=="Derby Count"){            imageLogo='derby';        }
    if(timeFoto=="Fulham"){            imageLogo='fulham';        }
    if(timeFoto=="Hull City"){            imageLogo='hullcity';        }
    if(timeFoto=="Middlesbrough"){      imageLogo='middlesbrough';        }
    if(timeFoto=="Norwich"){            imageLogo='norwich';        }
    if(timeFoto=="Nottingham Forest"){    imageLogo='nottingham';        }
    if(timeFoto=="QPR"){                imageLogo='qpr';        }
    if(timeFoto=="Reading"){            imageLogo='reading';        }
    if(timeFoto=="Sheffield United"){    imageLogo='sheffield';        }
    if(timeFoto=="Stoke City"){            imageLogo='stoke';        }
    if(timeFoto=="Swansea"){            imageLogo='swansea';        }
    if(timeFoto=="Watford"){            imageLogo='watford';        }

    if(timeFoto=="Atlético-GO"){                imageLogo='atleticogo';}
    if(timeFoto=="América-MG"){                imageLogo='americamg';        }
    if(timeFoto=="Cuiabá"){                imageLogo='cuiaba';        }
    if(timeFoto=="Avaí"){                imageLogo='avai';        }
    if(timeFoto=="Chapecoense"){            imageLogo='chapecoense';     }
    if(timeFoto=="Bragantino"){            imageLogo='bragantino';      }
    if(timeFoto=="Ceará"){               imageLogo='ceara';        }
    if(timeFoto=="Coritiba"){            imageLogo='coritiba';        }
    if(timeFoto=="Criciúma"){            imageLogo='criciuma';        }
    if(timeFoto=="Figueirense"){         imageLogo='figueirense';        }
    if(timeFoto=="Fortaleza"){          imageLogo='fortaleza';         }
    if(timeFoto=="Guarani"){            imageLogo='guarani';         }
    if(timeFoto=="Juventude"){         imageLogo='juventude';          }
    if(timeFoto=="Naútico"){            imageLogo='nautico';         }
    if(timeFoto=="Paraná"){            imageLogo='parana';          }
    if(timeFoto=="Paysandu"){          imageLogo='paysandu';          }

    if(timeFoto=="Ponte Preta"){       imageLogo='pontepreta';          }
    if(timeFoto=="Santa Cruz"){        imageLogo='santacruz';          }
    if(timeFoto=="Vitória"){            imageLogo='vitoria';         }

    if(timeFoto=="Argentino Juniors"){       imageLogo='argentinosjr';        }
    if(timeFoto=="Arsenal Sarandí"){            imageLogo='sarandi';     }
    if(timeFoto=="Banfield"){            imageLogo='banfield';      }
    if(timeFoto=="Boca Juniors"){               imageLogo='bocajuniors';        }
    if(timeFoto=="Colón"){                imageLogo='colon';        }
    if(timeFoto=="Defensa y Justicia"){                imageLogo='defensa';        }
    if(timeFoto=="Estudiantes"){            imageLogo='estudiantes';        }
    if(timeFoto=="Independiente"){         imageLogo='independiente';        }
    if(timeFoto=="Huracán"){             imageLogo='huracan';         }
    if(timeFoto=="Lanús"){               imageLogo='lanus';         }
    if(timeFoto=="Newell's Old Boys"){         imageLogo='newells';          }
    if(timeFoto=="Racing"){               imageLogo='racing';         }
    if(timeFoto=="River Plate"){            imageLogo='riverplate';          }
    if(timeFoto=="Rosario Central"){          imageLogo='rosariocentral';          }
    if(timeFoto=="San Lorenzo"){          imageLogo='sanlorenzo';          }
    if(timeFoto=="Talleres"){              imageLogo='talleres';          }
    if(timeFoto=="Vélez Sarsfield"){            imageLogo='velez';         }

    if(timeFoto=="Peñarol"){       imageLogo='penarol';        }
    if(timeFoto=="Nacional"){            imageLogo='nacional';     }
    if(timeFoto=="Olimpia"){            imageLogo='olimpia';      }
    if(timeFoto=="Cerro Porteño"){               imageLogo='cerro';        }
    if(timeFoto=="Libertad"){                imageLogo='libertad';        }
    if(timeFoto=="Colo-Colo"){            imageLogo='colocolo';        }
    if(timeFoto=="LaU"){         imageLogo='lau';        }
    if(timeFoto=="Univ. Católica"){             imageLogo='universidadcatolica';         }
    if(timeFoto=="Bolívar"){               imageLogo='bolivar';         }
    if(timeFoto=="Alianza Lima"){         imageLogo='alianzalima';          }
    if(timeFoto=="Sporting Cristal"){               imageLogo='sportingcristal';         }
    if(timeFoto=="Cienciano"){            imageLogo='cienciano';          }
    if(timeFoto=="Barcelona-EQU"){          imageLogo='barcelonaequ';          }
    if(timeFoto=="Emelec"){          imageLogo='emelec';          }
    if(timeFoto=="LDU"){              imageLogo='ldu';          }
    if(timeFoto=="Caracas"){            imageLogo='caracas';         }

    if(timeFoto=="América de Cali"){       imageLogo='americacali';        }
    if(timeFoto=="Atlético Nacional"){            imageLogo='atleticonacional';     }
    if(timeFoto=="Deportivo Cali"){            imageLogo='deportivocali';      }
    if(timeFoto=="Junior"){               imageLogo='junior';        }
    if(timeFoto=="I. Medellín"){                imageLogo='medellin';        }
    if(timeFoto=="Once Caldas"){            imageLogo='oncecaldas';        }
    if(timeFoto=="Millonarios"){         imageLogo='millonarios';        }
    if(timeFoto=="Santa Fé"){             imageLogo='santafe';         }
    if(timeFoto=="América-MEX"){               imageLogo='americamx';         }
    if(timeFoto=="Chivas Guadalajara"){         imageLogo='chivas';          }
    if(timeFoto=="Cruz Azul"){               imageLogo='cruzazul';         }
    if(timeFoto=="Monterrey"){            imageLogo='monterrey';          }
    if(timeFoto=="Pachuca"){          imageLogo='pachuca';          }
    if(timeFoto=="Pumas"){          imageLogo='pumas';          }
    if(timeFoto=="Tigres"){              imageLogo='tigres';          }
    if(timeFoto=="Toluca"){            imageLogo='toluca';         }

    if(timeFoto=="Ghuangzhou Evergrande"){       imageLogo='evergrande';        }
    if(timeFoto=="Beijing Guoan"){            imageLogo='beijing';     }
    if(timeFoto=="Shandong Luneng"){            imageLogo='shandong_luneng';      }
    if(timeFoto=="Shanghai SIPG"){               imageLogo='shanghai';        }
    if(timeFoto=="Kashima Antlers"){                imageLogo='kashima';        }
    if(timeFoto=="Urawa Red Diamonds"){            imageLogo='urawa';        }
    if(timeFoto=="Vissel Kobe"){             imageLogo='vissel_kobe';         }
    if(timeFoto=="FC Tokyo"){               imageLogo='toluca';         }
    if(timeFoto=="FC Seoul"){         imageLogo='seoul';        }
    if(timeFoto=="Jeonbuk Hyundai"){            imageLogo='jeonbuk';         }
    if(timeFoto=="Al Ain-EAU"){         imageLogo='al_ain';          }
    if(timeFoto=="Al Sadd-QAT"){               imageLogo='sadd';         }
    if(timeFoto=="Al Duhail-QAT"){            imageLogo='duhail';          }
    if(timeFoto=="Al Ahli"){          imageLogo='al_ahli';          }
    if(timeFoto=="Al Hilal"){          imageLogo='al_hilal';          }
    if(timeFoto=="Persepolis"){              imageLogo='persepolis';          }

    if(timeFoto=="Sydney FC"){       imageLogo='toluca';        }
    if(timeFoto=="Melbourne Victory"){            imageLogo='toluca';     }
    if(timeFoto=="Suwon Samsung"){               imageLogo='toluca';        }
    if(timeFoto=="Ulsan Hyundai"){            imageLogo='toluca';        }
    if(timeFoto=="Shanghai Shenhua"){                imageLogo='toluca';        }
    if(timeFoto=="Cerezo Osaka"){         imageLogo='toluca';          }
    if(timeFoto=="Kawasaki Frontale"){               imageLogo='kawasaki_frontale';         }
    if(timeFoto=="Kashiwa Reysol"){            imageLogo='toluca';          }
    if(timeFoto=="Gamba Osaka"){          imageLogo='toluca';          }
    if(timeFoto=="Yokohama F-Marinos"){            imageLogo='toluca';      }
    if(timeFoto=="Al Nassr"){             imageLogo='al_nassr';         }
    if(timeFoto=="Al Ittihad"){               imageLogo='toluca';         }
    if(timeFoto=="Auckland City"){            imageLogo='toluca';         }
    if(timeFoto=="Al Ahly"){          imageLogo='al_ahli';          }
    if(timeFoto=="Raja Casablanca"){              imageLogo='raja';          }
    if(timeFoto=="Zamalek"){         imageLogo='zamalek';        }

    if(timeFoto=="Atlanta United"){       imageLogo='atlanta';        }
    if(timeFoto=="Minnesota United"){            imageLogo='minnesota';     }
    if(timeFoto=="Columbus Crew"){               imageLogo='columbus';        }
    if(timeFoto=="DC United"){            imageLogo='dcunited';        }
    if(timeFoto=="FC Dallas"){         imageLogo='dallas';        }
    if(timeFoto=="Houston Dynamo"){                imageLogo='houston';        }
    if(timeFoto=="LA Galaxy"){            imageLogo='la';          }
    if(timeFoto=="NE Revolution"){               imageLogo='nerevolution';         }
    if(timeFoto=="NY City"){          imageLogo='nycity';          }
    if(timeFoto=="NY Red Bulls"){            imageLogo='nyredbull';      }
    if(timeFoto=="Orlando City"){             imageLogo='orlando';         }
    if(timeFoto=="Portland Timbers"){               imageLogo='portland';         }
    if(timeFoto=="Seattle Sounders"){            imageLogo='seattle';         }
    if(timeFoto=="Sporting Kansas City"){          imageLogo='kansas';          }
    if(timeFoto=="Inter Miami"){          imageLogo='miami';          }
    if(timeFoto=="Toronto FC"){              imageLogo='toronto';          }
    if(timeFoto=="Vancouver Whitecaps"){         imageLogo='vancouver';          }
    if(timeFoto=="Los Angeles FC"){         imageLogo='lafc';          }


    if(timeFoto=="Sunderland"){         imageLogo='sunderland';          }
    if(timeFoto=="I. Del Valle"){         imageLogo='delvalle';          }

    return imageLogo;
  }
  
  String campeonatoLogo(int numeroCampeonato){
    String campeonatoFoto = League(index: numeroCampeonato).getName();
    String imageLogo = '';
    if(campeonatoFoto=="Premier League"){       imageLogo = 'premierleague';       }
    if(campeonatoFoto=="Championship"){       imageLogo = 'championship';       }
    if(campeonatoFoto=="Serie A TIM"){       imageLogo = 'seriea';       }
    if(campeonatoFoto=="Serie B TIM"){       imageLogo = 'seriea';       }
    if(campeonatoFoto=="La Liga"){       imageLogo = 'laliga2';       }
    if(campeonatoFoto=="La Liga 2"){       imageLogo = 'laliga2';       }
    if(campeonatoFoto=="Ligue 1"){       imageLogo = 'ligue1';      }
    if(campeonatoFoto=="Bundesliga"){      imageLogo = 'bundesliga';       }
    if(campeonatoFoto=="Bundesliga 2"){      imageLogo = 'bundesliga';       }
    if(campeonatoFoto=="Liga Europeia"){       imageLogo = 'europaleague';       }
    if(campeonatoFoto=="Leste Europeu"){       imageLogo = 'leste';       }
    if(campeonatoFoto=="Brasileirão"){       imageLogo = 'brasileirao';        }
    if(campeonatoFoto=="Brasileirão - Série B"){      imageLogo = 'brasilserieb';       }
    if(campeonatoFoto=="Brasileirão - Série C"){      imageLogo = 'brasileirao';       }
    if(campeonatoFoto=="Paulistão"){      imageLogo = 'brasileirao';       }
    if(campeonatoFoto=="Campeonato Argentino"){       imageLogo = 'logoargentina';       }
    if(campeonatoFoto=="Sul-Americano"){       imageLogo = 'logosulamericana';       }
    if(campeonatoFoto=="Liga Colombia MX"){       imageLogo = 'logocolombia';       }
    if(campeonatoFoto=="MLS"){       imageLogo = 'logomls';       }
    if(campeonatoFoto=="Liga Ásia"){       imageLogo = 'asialeague';       }
    if(campeonatoFoto=="Liga Oriente Médio"){       imageLogo = 'championship';       }
    if(campeonatoFoto=="Outros"){       imageLogo = 'championship';       }

    return imageLogo;
  }
}