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



$(document).on('turbolinks:load', function() {

//$(function (){
//$(document).ready(function() {

//	$('button.add').click(function(){
//	$('button.add').on('click',function(){
//	doing it this way means that the tag doesn't have to exist yet.
//	Should still work as in the document ready block, but isn't.  Errrrr!
//	$(document).on('click', 'button.add', function(){
//	Previous versions were adding multiple rows to table? Not clear how or why.
	$('button.add').unbind().click(function(){

  	for (var i = 0; i < 5; i++) {
			count = $('table#alter_referral_sheet tr').length - 1;	// current row count
			$('table').append('<tr> <td>'+(count+1)+'</td> <td><input name="alter_referral_sheet[alter_referrals_attributes]['+count+'][plan_to_refer]" type="hidden" value="0" /><input type="checkbox" value="1" name="alter_referral_sheet[alter_referrals_attributes]['+count+'][plan_to_refer]" id="alter_referral_sheet_alter_referrals_attributes_'+count+'_plan_to_refer" /></td>' +
				'<td><input type="text" name="alter_referral_sheet[alter_referrals_attributes]['+count+'][name_cell]" id="alter_referral_sheet_alter_referrals_attributes_'+count+'_name_cell" /></td>' +
				'<td><input type="text" value="" name="alter_referral_sheet[alter_referrals_attributes]['+count+'][date_of_alter_interview]" id="alter_referral_sheet_alter_referrals_attributes_'+count+'_date_of_alter_interview" /></td>' +
				'<td><input type="text" value="" name="alter_referral_sheet[alter_referrals_attributes]['+count+'][alter_id]" id="alter_referral_sheet_alter_referrals_attributes_'+count+'_alter_id" /></td>' +
				'<td><input type="text" value="" name="alter_referral_sheet[alter_referrals_attributes]['+count+'][date_ego_notified]" id="alter_referral_sheet_alter_referrals_attributes_'+count+'_date_ego_notified" /></td>' +
				'<td><input type="text" value="" name="alter_referral_sheet[alter_referrals_attributes]['+count+'][date_ego_paid]" id="alter_referral_sheet_alter_referrals_attributes_'+count+'_date_ego_paid" /></td>' +
				'<td><input name="alter_referral_sheet[alter_referrals_attributes]['+count+'][_destroy]" type="hidden" value="0" /><input type="checkbox" value="1" name="alter_referral_sheet[alter_referrals_attributes]['+count+'][_destroy]" id="alter_referral_sheet_alter_referrals_attributes_'+count+'__destroy" /></td> </tr>');
		}
		return false;
	});


	$('table.demographics td').each(function (){
		t = $(this).text();
		if( t == parseInt(t) && t > 0 )
			$(this).css({ 'background' : 'yellow' });
	});

});
