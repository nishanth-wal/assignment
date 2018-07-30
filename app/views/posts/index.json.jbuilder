json.results @posts.each do |post|
	json.id post&.id
	json.title post&.title
	json.url post&.url
end