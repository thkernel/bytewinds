class DashboardController < ApplicationController
	before_action :authenticate_user!
	layout("dashboard")
	def index
		@total_users = User.count
		#@total_subscriptions = Subscription.count
		#@total_organizations = Organization.count
		#@total_cards = 0
	end
	def show
	end
end