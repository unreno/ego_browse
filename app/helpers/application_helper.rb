module ApplicationHelper
end
class ActionView::Helpers::FormBuilder
	def clear_all_radio_button_with_label(method, label=nil, value = nil, options = {})
#		value = label if value.blank?
#		@template.label( @object_name, method, "#{value}_disconnect", 
#		@template.label( @object_name, "#{method}_disconnected",
#				objectify_options(options.merge(:class => 'with_radio_button', :value => value )) ) do
		@template.label( @object_name, "#{method}_disconnected" ) do
			@template.radio_button( @object_name, 
				method, '', objectify_options(options) ) << 'clear all'
		end
	end
	def radio_button_with_label(method, label, value = nil, options = {})
		value = label if value.blank?
#		@template.label( @object_name, method, "#{value}_disconnect", 
#		@template.label( @object_name, "#{method}_disconnected",
#				objectify_options(options.merge(:class => 'with_radio_button', :value => value )) ) do
		@template.label( @object_name, "#{method}_disconnected",
				objectify_options(options.merge( :value => value )) ) do
			@template.radio_button( @object_name, 
				method, value, objectify_options(options) ) << label
		end
	end
end
