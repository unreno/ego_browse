module ApplicationHelper
end
class ActionView::Helpers::FormBuilder

#	def clear_all_radio_button_with_label(method, label=nil, value = nil, options = {})
#		@template.label( @object_name, "#{method}_disconnected" ) do
#			@template.radio_button( @object_name, 
#				method, '', objectify_options(options) ) << 'clear all'
#		end
#	end

	def radio_button_with_label(method, label, value = nil, options = {})
		value = label if value.blank?
		@template.content_tag( :div, class: 'field' )  do
			@template.radio_button( @object_name, 
				method, value, objectify_options(options) ) << 
			@template.label( @object_name, method, label,
				objectify_options(options.merge( :value => value )) )
		end
	end

	def radio_button_group_with_labels(method,labels_and_values = {}, options={})
		s = @template.label(@object_name,method) << "\n"
		s << @template.hidden_field(@object_name, method, value: nil) << "\n"
		if labels_and_values.is_a?(Hash)
			labels_and_values.each_pair do |label,value|
				s << self.radio_button_with_label(method, label, value, options) << "\n"
			end
		elsif labels_and_values.is_a?(Array)
			labels_and_values.each do |value|
				s << self.radio_button_with_label(method, value, value, options) << "\n"
			end
		else
			raise "Sorry. I'm confused"
		end
		s.html_safe
	end

end
