import 'package:fifa/classes/countries/words.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

//https://hampusborgos.github.io/country-flags/
//https://github.com/bytepark/country_icons/tree/master/icons/flags/png
Image funcFlagsList(String country, double _height, double _width){

  //Se não tiver país aparece a bandeira da antártida;
  Image code =  Image.asset('icons/flags/png/aq.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height);

  if(country == LeagueOfficialNames().englandCup ||
      country == LeagueOfficialNames().italyCup ||
      country == LeagueOfficialNames().spainCup ||
      country == LeagueOfficialNames().germanyCup ||
      country == LeagueOfficialNames().franceCup ||
      country == LeagueOfficialNames().portugalCup ||
      country == LeagueOfficialNames().russiaCup ||
      country == LeagueOfficialNames().turkeyCup ||
      country == LeagueOfficialNames().brazilCup){
    code = Image.asset(FIFAImages().campeonatoLogo(country), fit: BoxFit.fill,width: _width-10,height: _height);
  }
  if(country == LeagueOfficialNames().copaNordeste ||
      country == LeagueOfficialNames().copaVerde ||
      country == LeagueOfficialNames().mundial ||
      country == LeagueOfficialNames().championsLeague ||
      country == LeagueOfficialNames().libertadores ||
      country == LeagueOfficialNames().europaLeagueOficial ||
      country == LeagueOfficialNames().copaSulAmericana ||
      country == LeagueOfficialNames().concacaf){
    code = Image.asset(FIFAImages().campeonatoLogo(country), fit: BoxFit.fill,width: _width-10,height: _height);
  }

  if(country == LeagueOfficialNames().recopasula ||
      country == LeagueOfficialNames().recopaeuropa ||
      country == LeagueOfficialNames().recopabrasil
  ){
    code = Image.asset(FIFAImages().campeonatoLogo(country), fit: BoxFit.fill,width: _width-10,height: _height);
  }
  
  if(country == Words.country.urss){code = Image.asset('assets/flags/urss.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.ddr){code = Image.asset('assets/flags/ddr.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.iuguslavia){code = Image.asset('assets/flags/iuguslavia.png', fit: BoxFit.fill,width: _width,height: _height);}

  else if(country == Words.country.sp){code = Image.asset('assets/flags/sp.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.rj){code = Image.asset('assets/flags/rj.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.mg){code = Image.asset('assets/flags/mg.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.es){code = Image.asset('assets/flags/es.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.pr){code = Image.asset('assets/flags/pr.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.rs){code = Image.asset('assets/flags/rs.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.sc){code = Image.asset('assets/flags/sc.png', fit: BoxFit.fill,width: _width,height: _height);}

  else if(country == Words.country.df){code = Image.asset('assets/flags/df.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.go){code = Image.asset('assets/flags/go.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.mt){code = Image.asset('assets/flags/mt.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.ms){code = Image.asset('assets/flags/ms.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.to){code = Image.asset('assets/flags/to.png', fit: BoxFit.fill,width: _width,height: _height);}

  else if(country == Words.country.al){code = Image.asset('assets/flags/al.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.ba){code = Image.asset('assets/flags/ba.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.ce){code = Image.asset('assets/flags/ce.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.ma){code = Image.asset('assets/flags/ma.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.pb){code = Image.asset('assets/flags/pb.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.pe){code = Image.asset('assets/flags/pe.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.pi){code = Image.asset('assets/flags/pi.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.rn){code = Image.asset('assets/flags/rn.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.se){code = Image.asset('assets/flags/se.png', fit: BoxFit.fill,width: _width,height: _height);}

  else if(country == Words.country.ac){code = Image.asset('assets/flags/ac.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.am){code = Image.asset('assets/flags/am.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.ap){code = Image.asset('assets/flags/ap.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.pa){code = Image.asset('assets/flags/pa.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.ro){code = Image.asset('assets/flags/ro.png', fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.rr){code = Image.asset('assets/flags/rr.png', fit: BoxFit.fill,width: _width,height: _height);}



  if(country == Words.country.afghanistan){code = Image.asset('icons/flags/png/af.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height);}
  else if(country == Words.country.albania){code = Image.asset('icons/flags/png/al.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.angola){code = Image.asset('icons/flags/png/ao.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.algeria){code = Image.asset('icons/flags/png/dz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.andorra){code = Image.asset('icons/flags/png/ad.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.antiguaBarbuda){code = Image.asset('icons/flags/png/ag.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.argentina){code = Image.asset('icons/flags/png/ar.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.armenia){code = Image.asset('icons/flags/png/am.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.aruba){code = Image.asset('icons/flags/png/aw.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.australia){code = Image.asset('icons/flags/png/hm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.austria){code = Image.asset('icons/flags/png/at.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.azerbaijan){code = Image.asset('icons/flags/png/az.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.bahrein){code = Image.asset('icons/flags/png/bh.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.bahamas){code = Image.asset('icons/flags/png/bs.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.bangladesh){code = Image.asset('icons/flags/png/bd.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.barbados){code = Image.asset('icons/flags/png/bb.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.belgium){code = Image.asset('icons/flags/png/be.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.belarus){code = Image.asset('icons/flags/png/by.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.belize){code = Image.asset('icons/flags/png/bz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.benin){code = Image.asset('icons/flags/png/bj.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.bermudas){code = Image.asset('icons/flags/png/bm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.bolivia){code = Image.asset('icons/flags/png/bo.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.bosnia){code = Image.asset('icons/flags/png/ba.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.botswana){code = Image.asset('icons/flags/png/bw.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.bulgaria){code = Image.asset('icons/flags/png/bg.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.burkina){code = Image.asset('icons/flags/png/bf.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.burundi){code = Image.asset('icons/flags/png/bi.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.bhoutan){code = Image.asset('icons/flags/png/bt.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.brunei){code = Image.asset('icons/flags/png/bn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.brazil){code = Image.asset('icons/flags/png/br.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.cameroon){code = Image.asset('icons/flags/png/cm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.cambodia){code = Image.asset('icons/flags/png/kh.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.canada){code = Image.asset('icons/flags/png/ca.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.capeVerde){code = Image.asset('icons/flags/png/cv.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.centralAfrica){code = Image.asset('icons/flags/png/cf.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.chad){code = Image.asset('icons/flags/png/ro.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.china){code = Image.asset('icons/flags/png/cn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.chile){code = Image.asset('icons/flags/png/cl.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.colombia){code = Image.asset('icons/flags/png/co.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.comoros){code = Image.asset('icons/flags/png/km.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.congo){code = Image.asset('icons/flags/png/cg.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.congoRD){code = Image.asset('icons/flags/png/cd.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.costaRica){code = Image.asset('icons/flags/png/cr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.cuba){code = Image.asset('icons/flags/png/cu.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.curacao){code = Image.asset('icons/flags/png/cw.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.croatia){code = Image.asset('icons/flags/png/hr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.cyprus){code = Image.asset('icons/flags/png/cy.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.czechRepublic){code = Image.asset('icons/flags/png/cz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.denmark){code = Image.asset('icons/flags/png/dk.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.djibouti){code = Image.asset('icons/flags/png/dj.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.dominica){code = Image.asset('icons/flags/png/dm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.dominicanRepublic){code = Image.asset('icons/flags/png/do.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.ecuador){code = Image.asset('icons/flags/png/ec.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.egypt){code = Image.asset('icons/flags/png/eg.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.elsalvador){code = Image.asset('icons/flags/png/sv.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.england){code = Image.asset('icons/flags/png/gb-eng.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.ethiopia){code = Image.asset('icons/flags/png/et.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.eritrea){code = Image.asset('icons/flags/png/er.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.estonia){code = Image.asset('icons/flags/png/ee.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.faroe){code = Image.asset('icons/flags/png/fo.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.finland){code = Image.asset('icons/flags/png/fi.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.france){code = Image.asset('icons/flags/png/fr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.gambia){code = Image.asset('icons/flags/png/gm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.gabon){code = Image.asset('icons/flags/png/ga.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.georgia){code = Image.asset('icons/flags/png/ge.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.gibraltar){code = Image.asset('icons/flags/png/gi.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.ghana){code = Image.asset('icons/flags/png/gh.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.germany){code = Image.asset('icons/flags/png/de.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.grenada){code = Image.asset('icons/flags/png/gd.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.greece){code = Image.asset('icons/flags/png/gr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.guatemala){code = Image.asset('icons/flags/png/gt.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.guyana){code = Image.asset('icons/flags/png/gy.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.guinea){code = Image.asset('icons/flags/png/gn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.guineaEquatorial){code = Image.asset('icons/flags/png/gq.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.guineaBissau){code = Image.asset('icons/flags/png/gw.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.haiti){code = Image.asset('icons/flags/png/ht.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.honduras){code = Image.asset('icons/flags/png/hn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.hungary){code = Image.asset('icons/flags/png/hu.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.iceland){code = Image.asset('icons/flags/png/is.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.italy){code = Image.asset('icons/flags/png/it.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.india){code = Image.asset('icons/flags/png/in.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.indonesia){code = Image.asset('icons/flags/png/id.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.iraq){code = Image.asset('icons/flags/png/iq.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.iran){code = Image.asset('icons/flags/png/ir.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.ireland){code = Image.asset('icons/flags/png/ie.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.israel){code = Image.asset('icons/flags/png/il.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.ivorycoast){code = Image.asset('icons/flags/png/ci.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.japan){code = Image.asset('icons/flags/png/jp.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.jamaica){code = Image.asset('icons/flags/png/jm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.jordan){code = Image.asset('icons/flags/png/jo.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.kazakhstan){code = Image.asset('icons/flags/png/kz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.kenya){code = Image.asset('icons/flags/png/ke.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.kiribati){code = Image.asset('icons/flags/png/ki.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.kosovo){code = Image.asset('icons/flags/png/xk.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.kuwait){code = Image.asset('icons/flags/png/kw.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.kyrgyzstan){code = Image.asset('icons/flags/png/kg.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.laos){code = Image.asset('icons/flags/png/la.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.latvia){code = Image.asset('icons/flags/png/lv.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.lebanon){code = Image.asset('icons/flags/png/lb.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.lesoto){code = Image.asset('icons/flags/png/ls.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.libya){code = Image.asset('icons/flags/png/ly.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.liechtenstein){code = Image.asset('icons/flags/png/li.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.lithuania){code = Image.asset('icons/flags/png/lt.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.liberia){code = Image.asset('icons/flags/png/lr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.luxembourg){code = Image.asset('icons/flags/png/lu.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.macedonia){code = Image.asset('icons/flags/png/mk.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.madagascar){code = Image.asset('icons/flags/png/mg.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.malaysia){code = Image.asset('icons/flags/png/my.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.maldives){code = Image.asset('icons/flags/png/mv.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.mali){code = Image.asset('icons/flags/png/ml.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.malawi){code = Image.asset('icons/flags/png/mw.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.malta){code = Image.asset('icons/flags/png/mt.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.mauritania){code = Image.asset('icons/flags/png/mr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.mauritius){code = Image.asset('icons/flags/png/mu.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.mexico){code = Image.asset('icons/flags/png/mx.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.micronesia){code = Image.asset('icons/flags/png/fm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.moldova){code = Image.asset('icons/flags/png/md.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.monaco){code = Image.asset('icons/flags/png/mc.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.montenegro){code = Image.asset('icons/flags/png/me.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.mongolia){code = Image.asset('icons/flags/png/mn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.morocco){code = Image.asset('icons/flags/png/ma.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.mozambique){code = Image.asset('icons/flags/png/mz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.myanmar){code = Image.asset('icons/flags/png/mm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.namibia){code = Image.asset('icons/flags/png/na.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.nauru){code = Image.asset('icons/flags/png/nr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.netherlands){code = Image.asset('icons/flags/png/nl.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.nepal){code = Image.asset('icons/flags/png/np.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.nicaragua){code = Image.asset('icons/flags/png/ni.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.niger){code = Image.asset('icons/flags/png/ne.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.nigeria){code = Image.asset('icons/flags/png/ng.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.newZealand){code = Image.asset('icons/flags/png/nz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.norway){code = Image.asset('icons/flags/png/no.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.northKorea){code = Image.asset('icons/flags/png/kp.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.northernIreland){code = Image.asset('icons/flags/png/gg.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.oman){code = Image.asset('icons/flags/png/om.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.pakistan){code = Image.asset('icons/flags/png/pk.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.palestine){code = Image.asset('icons/flags/png/ps.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.panama){code = Image.asset('icons/flags/png/pa.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.papua){code = Image.asset('icons/flags/png/pg.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.paraguay){code = Image.asset('icons/flags/png/py.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.peru){code = Image.asset('icons/flags/png/pe.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.poland){code = Image.asset('icons/flags/png/pl.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.portugal){code = Image.asset('icons/flags/png/pt.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.puertoRico){code = Image.asset('icons/flags/png/pr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.philippines){code = Image.asset('icons/flags/png/ph.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.qatar){code = Image.asset('icons/flags/png/qa.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.romania){code = Image.asset('icons/flags/png/ro.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.russia){code = Image.asset('icons/flags/png/ru.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.rwanda){code = Image.asset('icons/flags/png/rw.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.sanMarino){code = Image.asset('icons/flags/png/sm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.samoa){code = Image.asset('icons/flags/png/ws.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.senegal){code = Image.asset('icons/flags/png/sn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.serbia){code = Image.asset('icons/flags/png/rs.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.scotland){code = Image.asset('icons/flags/png/gb-sct.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.seychelles){code = Image.asset('icons/flags/png/sc.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.sierraLeone){code = Image.asset('icons/flags/png/sl.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.singapore){code = Image.asset('icons/flags/png/sg.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.slovakia){code = Image.asset('icons/flags/png/sk.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.slovenia){code = Image.asset('icons/flags/png/si.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.somalia){code = Image.asset('icons/flags/png/so.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.southArabia){code = Image.asset('icons/flags/png/sa.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.southAfrica){code = Image.asset('icons/flags/png/za.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.southKorea){code = Image.asset('icons/flags/png/kr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.spain){code = Image.asset('icons/flags/png/es.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.sweden){code = Image.asset('icons/flags/png/se.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.switzerland){code = Image.asset('icons/flags/png/ch.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.syria){code = Image.asset('icons/flags/png/sy.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.stKitts){code = Image.asset('icons/flags/png/kn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.stLucia){code = Image.asset('icons/flags/png/lc.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.srilanka){code = Image.asset('icons/flags/png/lk.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.sudan){code = Image.asset('icons/flags/png/sd.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.suriname){code = Image.asset('icons/flags/png/sr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.taiwan){code = Image.asset('icons/flags/png/tw.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.timor){code = Image.asset('icons/flags/png/tl.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.tajikistan){code = Image.asset('icons/flags/png/tj.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.tanzania){code = Image.asset('icons/flags/png/tz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.thailand){code = Image.asset('icons/flags/png/th.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.trinidadTobago){code = Image.asset('icons/flags/png/tt.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.togo){code = Image.asset('icons/flags/png/tg.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.tonga){code = Image.asset('icons/flags/png/to.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.tunisia){code = Image.asset('icons/flags/png/tn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.turkey){code = Image.asset('icons/flags/png/tr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.turkmenistan){code = Image.asset('icons/flags/png/tm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.uganda){code = Image.asset('icons/flags/png/ug.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.ukraine){code = Image.asset('icons/flags/png/ua.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.uae){code = Image.asset('icons/flags/png/ae.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.unitedStates){code = Image.asset('icons/flags/png/us.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.uruguay){code = Image.asset('icons/flags/png/uy.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.uzbekistan){code = Image.asset('icons/flags/png/uz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.venezuela){code = Image.asset('icons/flags/png/ve.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.vietnam){code = Image.asset('icons/flags/png/vn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.wales){code = Image.asset('icons/flags/png/gb-wls.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.yemen){code = Image.asset('icons/flags/png/ye.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.zambia){code = Image.asset('icons/flags/png/zm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  else if(country == Words.country.zimbabwe){code = Image.asset('icons/flags/png/zw.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}

  return code;
}