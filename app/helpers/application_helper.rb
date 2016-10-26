module ApplicationHelper
end
class ActionView::Helpers::FormBuilder
	def radio_button_with_label(method, tag_value, options = {})
		@template.label( @object_name, method, tag_value, 
				objectify_options(options.merge(:class => 'with_radio_button', :value => tag_value )) ) do
			@template.radio_button( @object_name, 
				method, tag_value, objectify_options(options) ) << tag_value
		end
	end
end
