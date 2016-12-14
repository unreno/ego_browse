// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



$(function (){
//$(document).ready(function() {

//	$('button.add').click(function(){
//	$('button.add').on('click',function(){
//	doing it this way means that the tag doesn't have to exist yet.
//	Should still work as in the document ready block, but isn't.  Errrrr!
	$(document).on('click', 'button.add', function(){
		i = $('table#alter_referral_sheet tr').length - 1
		$('table').append('<tr> <td>'+(i+1)+'</td> <td><input name="alter_referral_sheet[alter_referrals_attributes]['+i+'][plan_to_refer]" type="hidden" value="0" /><input type="checkbox" value="1" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][plan_to_refer]" id="alter_referral_sheet_alter_referrals_attributes_'+i+'_plan_to_refer" /></td>' +
			'<td><input type="text" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][first_name]" id="alter_referral_sheet_alter_referrals_attributes_'+i+'_first_name" /></td>' +
			'<td><select name="alter_referral_sheet[alter_referrals_attributes]['+i+'][last_initial]" id="alter_referral_sheet_alter_referrals_attributes_'+i+'_last_initial"><option value=""></option> <option value="A">A</option> <option value="B">B</option> <option value="C">C</option> <option value="D">D</option> <option value="E">E</option> <option value="F">F</option> <option value="G">G</option> <option value="H">H</option> <option value="I">I</option> <option value="J">J</option> <option value="K">K</option> <option value="L">L</option> <option value="M">M</option> <option value="N">N</option> <option value="O">O</option> <option value="P">P</option> <option value="Q">Q</option> <option value="R">R</option> <option value="S">S</option> <option value="T">T</option> <option value="U">U</option> <option value="V">V</option> <option value="W">W</option> <option value="X">X</option> <option value="Y">Y</option> <option value="Z">Z</option></select></td>' +
			'<td><input type="text" value="" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][last_4_cell]" id="alter_referral_sheet_alter_referrals_attributes_'+i+'_last_4_cell" /></td>' +
			'<td><select id="alter_referral_sheet_alter_referrals_attributes_'+i+'_date_of_alter_interview_1i" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][date_of_alter_interview(1i)]"> <option value="2011">2011</option> <option value="2012">2012</option> <option value="2013">2013</option> <option value="2014">2014</option> <option value="2015">2015</option> <option value="2016" selected="selected">2016</option> <option value="2017">2017</option> <option value="2018">2018</option> <option value="2019">2019</option> <option value="2020">2020</option> <option value="2021">2021</option> </select> <select id="alter_referral_sheet_alter_referrals_attributes_'+i+'_date_of_alter_interview_2i" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][date_of_alter_interview(2i)]"> <option value="1">January</option> <option value="2">February</option> <option value="3">March</option> <option value="4">April</option> <option value="5">May</option> <option value="6">June</option> <option value="7">July</option> <option value="8">August</option> <option value="9">September</option> <option value="10">October</option> <option value="11">November</option> <option value="12" selected="selected">December</option> </select> <select id="alter_referral_sheet_alter_referrals_attributes_'+i+'_date_of_alter_interview_3i" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][date_of_alter_interview(3i)]"> <option value="1">1</option> <option value="2">2</option> <option value="3">3</option> <option value="4">4</option> <option value="5">5</option> <option value="6">6</option> <option value="7" selected="selected">7</option> <option value="8">8</option> <option value="9">9</option> <option value="10">10</option> <option value="11">11</option> <option value="12">12</option> <option value="13">13</option> <option value="14">14</option> <option value="15">15</option> <option value="16">16</option> <option value="17">17</option> <option value="18">18</option> <option value="19">19</option> <option value="20">20</option> <option value="21">21</option> <option value="22">22</option> <option value="23">23</option> <option value="24">24</option> <option value="25">25</option> <option value="26">26</option> <option value="27">27</option> <option value="28">28</option> <option value="29">29</option> <option value="30">30</option> <option value="31">31</option> </select> </td>' +
			'<td><input type="text" value="" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][alter_id]" id="alter_referral_sheet_alter_referrals_attributes_'+i+'_alter_id" /></td>' +
			'<td><select id="alter_referral_sheet_alter_referrals_attributes_'+i+'_date_ego_notified_1i" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][date_ego_notified(1i)]"> <option value="2011">2011</option> <option value="2012">2012</option> <option value="2013">2013</option> <option value="2014">2014</option> <option value="2015">2015</option> <option value="2016" selected="selected">2016</option> <option value="2017">2017</option> <option value="2018">2018</option> <option value="2019">2019</option> <option value="2020">2020</option> <option value="2021">2021</option> </select> <select id="alter_referral_sheet_alter_referrals_attributes_'+i+'_date_ego_notified_2i" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][date_ego_notified(2i)]"> <option value="1">January</option> <option value="2">February</option> <option value="3">March</option> <option value="4">April</option> <option value="5">May</option> <option value="6">June</option> <option value="7">July</option> <option value="8">August</option> <option value="9">September</option> <option value="10">October</option> <option value="11">November</option> <option value="12" selected="selected">December</option> </select> <select id="alter_referral_sheet_alter_referrals_attributes_'+i+'_date_ego_notified_3i" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][date_ego_notified(3i)]"> <option value="1">1</option> <option value="2">2</option> <option value="3">3</option> <option value="4">4</option> <option value="5">5</option> <option value="6">6</option> <option value="7" selected="selected">7</option> <option value="8">8</option> <option value="9">9</option> <option value="10">10</option> <option value="11">11</option> <option value="12">12</option> <option value="13">13</option> <option value="14">14</option> <option value="15">15</option> <option value="16">16</option> <option value="17">17</option> <option value="18">18</option> <option value="19">19</option> <option value="20">20</option> <option value="21">21</option> <option value="22">22</option> <option value="23">23</option> <option value="24">24</option> <option value="25">25</option> <option value="26">26</option> <option value="27">27</option> <option value="28">28</option> <option value="29">29</option> <option value="30">30</option> <option value="31">31</option> </select> </td>' +
			'<td><select id="alter_referral_sheet_alter_referrals_attributes_'+i+'_date_ego_paid_1i" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][date_ego_paid(1i)]"> <option value="2011">2011</option> <option value="2012">2012</option> <option value="2013">2013</option> <option value="2014">2014</option> <option value="2015">2015</option> <option value="2016" selected="selected">2016</option> <option value="2017">2017</option> <option value="2018">2018</option> <option value="2019">2019</option> <option value="2020">2020</option> <option value="2021">2021</option> </select> <select id="alter_referral_sheet_alter_referrals_attributes_'+i+'_date_ego_paid_2i" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][date_ego_paid(2i)]"> <option value="1">January</option> <option value="2">February</option> <option value="3">March</option> <option value="4" selected="selected">April</option> <option value="5">May</option> <option value="6">June</option> <option value="7">July</option> <option value="8">August</option> <option value="9">September</option> <option value="10">October</option> <option value="11">November</option> <option value="12">December</option> </select> <select id="alter_referral_sheet_alter_referrals_attributes_'+i+'_date_ego_paid_3i" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][date_ego_paid(3i)]"> <option value="1">1</option> <option value="2">2</option> <option value="3">3</option> <option value="4">4</option> <option value="5">5</option> <option value="6">6</option> <option value="7" selected="selected">7</option> <option value="8">8</option> <option value="9">9</option> <option value="10">10</option> <option value="11">11</option> <option value="12">12</option> <option value="13">13</option> <option value="14">14</option> <option value="15">15</option> <option value="16">16</option> <option value="17">17</option> <option value="18">18</option> <option value="19">19</option> <option value="20">20</option> <option value="21">21</option> <option value="22">22</option> <option value="23">23</option> <option value="24">24</option> <option value="25">25</option> <option value="26">26</option> <option value="27">27</option> <option value="28">28</option> <option value="29">29</option> <option value="30">30</option> <option value="31">31</option> </select> </td>' +
			'<td><input name="alter_referral_sheet[alter_referrals_attributes]['+i+'][_destroy]" type="hidden" value="0" /><input type="checkbox" value="1" name="alter_referral_sheet[alter_referrals_attributes]['+i+'][_destroy]" id="alter_referral_sheet_alter_referrals_attributes_'+i+'__destroy" /></td> </tr>')
		return false;
	});
});
