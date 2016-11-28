module ApplicationHelper
end
class ActionView::Helpers::FormBuilder
	def radio_button_with_label(method, label, value = nil, options = {})
		value = label if value.blank?
		@template.label( @object_name, method, value, 
				objectify_options(options.merge(:class => 'with_radio_button', :value => value )) ) do
			@template.radio_button( @object_name, 
				method, value, objectify_options(options) ) << label
		end
	end
end
