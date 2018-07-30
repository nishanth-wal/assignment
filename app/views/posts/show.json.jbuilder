json.results 
	json.id @post&.id
	json.title @post&.title
	json.url @post&.url
	json.email @post.user.email if @post.user_id.present?
