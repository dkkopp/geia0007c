/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

module com.clanmcpherson.geia0007c
{
  requires transitive jakarta.xml.bind;

  exports com.clanmchperson.geia0007c;

  opens com.clanmchperson.geia0007c to jakarta.xml.bind;
}
