import 'package:fifa/classes/words.dart';
import 'package:flutter/material.dart';

//https://hampusborgos.github.io/country-flags/
//https://github.com/bytepark/country_icons/tree/master/icons/flags/png
Image funcFlagsList(String country, double _height, double _width){

  //Se não tiver país aparece a bandeira da antártida;
  Image code =  Image.asset('icons/flags/png/aq.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height);

  if(country == Words.country.afghanistan){code = Image.asset('icons/flags/png/af.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height);}
  if(country == Words.country.angola){code = Image.asset('icons/flags/png/ao.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.algeria){code = Image.asset('icons/flags/png/dz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.argentina){code = Image.asset('icons/flags/png/ar.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.australia){code = Image.asset('icons/flags/png/hm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.austria){code = Image.asset('icons/flags/png/at.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.barbados){code = Image.asset('icons/flags/png/bb.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.belgium){code = Image.asset('icons/flags/png/be.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.bulgaria){code = Image.asset('icons/flags/png/bg.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.brazil){code = Image.asset('icons/flags/png/br.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.canada){code = Image.asset('icons/flags/png/ca.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.china){code = Image.asset('icons/flags/png/cn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.chile){code = Image.asset('icons/flags/png/cl.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.cuba){code = Image.asset('icons/flags/png/cu.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.colombia){code = Image.asset('icons/flags/png/co.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.costaRica){code = Image.asset('icons/flags/png/cr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.croatia){code = Image.asset('icons/flags/png/hr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.czechRepublic){code = Image.asset('icons/flags/png/cz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.denmark){code = Image.asset('icons/flags/png/dk.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.dominicanRepublic){code = Image.asset('icons/flags/png/do.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.ecuador){code = Image.asset('icons/flags/png/ec.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.egypt){code = Image.asset('icons/flags/png/eg.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.england){code = Image.asset('icons/flags/png/gb.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.ethiopia){code = Image.asset('icons/flags/png/et.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.finland){code = Image.asset('icons/flags/png/fi.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.france){code = Image.asset('icons/flags/png/fr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.germany){code = Image.asset('icons/flags/png/de.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.greece){code = Image.asset('icons/flags/png/gr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.honduras){code = Image.asset('icons/flags/png/hn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.iceland){code = Image.asset('icons/flags/png/is.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.italy){code = Image.asset('icons/flags/png/it.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.india){code = Image.asset('icons/flags/png/in.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.indonesia){code = Image.asset('icons/flags/png/id.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.iran){code = Image.asset('icons/flags/png/ir.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.ireland){code = Image.asset('icons/flags/png/ie.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.israel){code = Image.asset('icons/flags/png/il.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.japan){code = Image.asset('icons/flags/png/jp.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.jamaica){code = Image.asset('icons/flags/png/jm.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.kazakhstan){code = Image.asset('icons/flags/png/kz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.kenya){code = Image.asset('icons/flags/png/ke.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.lithuania){code = Image.asset('icons/flags/png/lt.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.malaysia){code = Image.asset('icons/flags/png/my.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.mali){code = Image.asset('icons/flags/png/ml.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.mexico){code = Image.asset('icons/flags/png/mx.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.mongolia){code = Image.asset('icons/flags/png/mn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.netherlands){code = Image.asset('icons/flags/png/nl.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.nigeria){code = Image.asset('icons/flags/png/ng.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.newZealand){code = Image.asset('icons/flags/png/nz.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.norway){code = Image.asset('icons/flags/png/no.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.panama){code = Image.asset('icons/flags/png/pa.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.peru){code = Image.asset('icons/flags/png/pe.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.paraguay){code = Image.asset('icons/flags/png/py.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.poland){code = Image.asset('icons/flags/png/pl.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.portugal){code = Image.asset('icons/flags/png/pt.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.puertoRico){code = Image.asset('icons/flags/png/pr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.philippines){code = Image.asset('icons/flags/png/ph.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.romania){code = Image.asset('icons/flags/png/ro.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.russia){code = Image.asset('icons/flags/png/ru.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.senegal){code = Image.asset('icons/flags/png/sn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.serbia){code = Image.asset('icons/flags/png/rs.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.scotland){code = Image.asset('icons/flags/png/gb-sct.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.slovakia){code = Image.asset('icons/flags/png/sk.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.slovenia){code = Image.asset('icons/flags/png/si.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.southArabia){code = Image.asset('icons/flags/png/sa.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.southAfrica){code = Image.asset('icons/flags/png/za.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.southKorea){code = Image.asset('icons/flags/png/kr.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.spain){code = Image.asset('icons/flags/png/es.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.sweden){code = Image.asset('icons/flags/png/se.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.switzerland){code = Image.asset('icons/flags/png/ch.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.thailand){code = Image.asset('icons/flags/png/th.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.trinidadTobago){code = Image.asset('icons/flags/png/tt.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.tunisia){code = Image.asset('icons/flags/png/tn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.ukraine){code = Image.asset('icons/flags/png/ua.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.unitedStates){code = Image.asset('icons/flags/png/us.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.venezuela){code = Image.asset('icons/flags/png/ve.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.vietnam){code = Image.asset('icons/flags/png/vn.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.wales){code = Image.asset('icons/flags/png/gb-wls.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  if(country == Words.country.uruguay){code = Image.asset('icons/flags/png/uy.png', package: 'country_icons',fit: BoxFit.fill,width: _width,height: _height,);}
  return code;
}
