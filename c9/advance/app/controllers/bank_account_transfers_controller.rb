#9.37
class BankAccountTransfersController < ApplicationController
	def create
		from = BankAccount.find(params[:from_account_id])
		to = BankAccount.find(params[:to_account_id])
		transfered_money = Money.new(params[:amount], params[:currency])

		bank_account_transfer_service = BankAccountTransferService.new(from, to)
		bank_account_transfer_service.transfer(transfered_money)
	end
end
