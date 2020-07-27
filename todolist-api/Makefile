server:
	rails server

gen-swagger:
	RAILS_ENV=test rails rswag

gen-spec:
	rails generate rspec:swagger API::Api::V1::$(name)

test:
	bundle exec rspec

gen-serializer:
	rails g serializer $(name)

.PHONY: server gen-swagger gen-spec test
