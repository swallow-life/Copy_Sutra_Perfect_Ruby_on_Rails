#9.4
require 'rails_helper'

RSpec.describe EncryptionWrapper, type: :model do
	let(:encryption_wrapper) { EncryptionWrapper.new("encrypted_attribute") }

	describe "#before_save" do
		let(:record) { stub(:record, encrypted_attribute: "plain text") }
		subject { encryption_wrapper.before_save(record) }

		it "encrypts speciffied attributes" do
			expect { subject }.to change { record.encrypted_attribute }.from("plain text").to("encrypted text")
		end
	end

	describe "#after_save" do
		let(:record) { stub(:record, encrypted_attribute: "encrypted text") }
		subject { encryption_wrapper.after_save(record) }

		it "decrypts speciffied attributes" do
			expect{ subject }.to change { record.encrypted_attribute }.from("encrypted text").to("plain text")
		end
	end
end

end
