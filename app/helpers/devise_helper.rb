module DeviseHelper
	def devise_error_messages!
		return '' if resources.errors.empty?

		messages = resource.errors.full_messages.map { |msg| content_tag(:p, msg) }.join
		sentence = I18n.t('errors.messages.not_saved', count: resource.errors.count,
			resource: resource.class.model_name.human.downcase)

		html = <<-HTML
		<div class="alert alert-danger alter-dismissable">
			<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span>
				<span class="sr-only">Close</span>
			</button>
			<h4>#{sentence}</h4>
			#{messages}
		</div>
		HTML

		html.html_safe
	end
end
